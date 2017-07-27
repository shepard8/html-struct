open Core
open Printf
module Regex = Re2.Regex

module String_comparator = Comparator.Make (String)
type 'a smap = (string, 'a, String_comparator.comparator_witness) Map.t

type element = {
  name : string;
  categories : category list; (* A note can be attached *)
  (*
  contexts : string list;
  content_model : string list;
  content_attributes_groups : attribute_group list;
  content_attributes : attribute list;
  *)
}
and category = {
  name : string;
  mutable elements : element list;
}

type t = {
  elements : element smap;
  categories : category smap;
}

let r_elements = Regex.create_exn
  "<h4 id=\"the-[a-zA-Z0-9,-]+elements?\"><span class=\"secno\">4\\.(?P<head>(?sU).*)<dl class=\"element\">(?P<body>(?sU).*)</dl>"
let r_elements_names = Regex.create_exn
  "<dfn( id=\"((?U).*)\")?><code>(?P<name>(?U).*)</code></dfn>"

type elem_props = {
  categories : string list;
  contexts : string list;
  content_model : string list;
  content_attributes : string list;
  tag_omission : string list;
  aria_role : string list;
  aria_state_prop : string list;
  dom_interface : string list;
}

let parse_dds (body : string) : string list =
  let r = Regex.create_exn "<dd>(?P<content>(?sU).*)</dd>" in
  Regex.find_all_exn ~sub:(`Name "content") r body

let parse_body (body : string) : elem_props =
  match Regex.split (Regex.create_exn "<dt>") body with
  | _ :: c :: co :: cm :: ca :: t :: ar :: asp :: di :: [] -> {
    categories = parse_dds c;
    contexts = parse_dds co;
    content_model = parse_dds cm;
    content_attributes = parse_dds ca;
    tag_omission = parse_dds t;
    aria_role = parse_dds ar;
    aria_state_prop = parse_dds asp;
    dom_interface = parse_dds di
  }
  | _ -> assert false

type unparsed = string * string * string

let r_category = Regex.create_exn "^<a(?:(?sU).*)href=\"#[a-zA-Z0-9,-]+\">(?P<cat>(?sU).*)</a>"
let add_categories ((t, unparsed) : t * unparsed list) (name : string) (dds : string list) : t * unparsed list =
  let f ((t, unparsed) : t * unparsed list) (dd : string) =
    if dd = "None." then (t, unparsed)
    else if Regex.matches r_category dd then
      (* Add category *)
      let catname = Regex.find_first_exn ~sub:(`Name "cat") r_category dd in
      let t =
        if Map.mem t.categories catname
        then t
        else
          let cat = { name = catname; elements = [] } in
          { t with categories = Map.add t.categories catname cat }
      in
      (* Now category is present *)
      let cat = Map.find_exn t.categories catname in
      (* Retrieve element or create a new one, and add category *)
      let elt = try
        let e = Map.find_exn t.elements name in
        { e with categories = cat :: e.categories }
      with Not_found ->
        { name; categories = [cat] }
      in
      (* Add the element in each of his categories *)
      List.iter elt.categories ~f:(fun c ->
        if phys_equal c cat then c.elements <- elt :: c.elements
        else c.elements <- elt :: (List.tl_exn c.elements)
      );
      (* Add the element in the main structure *)
      ({ t with elements = Map.add t.elements name elt }, unparsed)
    else (t, (name, "category", dd) :: unparsed)
  in List.fold dds ~init:(t, unparsed) ~f

let handle_element (t, unparsed) (name : string) (body : string) : t * unparsed list =
  let parts = parse_body body in
  let (t, unparsed) = add_categories (t, unparsed) name parts.categories in
  (t, unparsed)

let get_names (head : string) : string list =
  let names = Regex.get_matches_exn r_elements_names head in
  let init = [] in
  let f l m = Regex.Match.get_exn (`Name "name") m :: l in
  List.fold names ~init ~f

let handle_elements ((t, unparsed) : t * unparsed list) (names : string list) (body : string) : t * unparsed list =
  let f ((t, unparsed) : t * unparsed list) (name : string) : t * unparsed list =
    handle_element (t, unparsed) name body
  in
  List.fold names ~init:(t, unparsed) ~f

let extract (file : string) : t * unparsed list =
  let content = In_channel.read_all file in
  let matches = Regex.get_matches_exn r_elements content in
  let elements = Map.empty ~comparator:String_comparator.comparator in
  let categories = Map.empty ~comparator:String_comparator.comparator in
  let t = { elements; categories } in
  let f t m =
    let head = Regex.Match.get_exn (`Name "head") m in
    let body = Regex.Match.get_exn (`Name "body") m in
    let names = get_names head in
    handle_elements t names body
  in
  List.fold matches ~init:(t, []) ~f

let print_sql t =
  let elements = String.concat ~sep:", " (List.map (Map.keys t.elements) ~f:(sprintf "('%s')")) in
  printf "INSERT INTO element (elt_name) VALUES %s;\n\n" elements;
  let categories = String.concat ~sep:", " (List.map (Map.keys t.categories) ~f:(sprintf "('%s')")) in
  printf "INSERT INTO category (cat_name) VALUES %s;\n\n" categories;
  let element_categories = String.concat ~sep:", " (List.map (Map.data t.elements) ~f:(fun e ->
    String.concat ~sep:", " (List.map e.categories ~f:(fun c ->
      sprintf "('%s', '%s')" e.name c.name
    ))
  )) in
  printf "INSERT INTO element_category (elt_name, cat_name) VALUES %s;\n\n" element_categories

let () =
  let file = Sys.argv.(1) in
  let t, unparsed = extract file in
  print_sql t;
  print_endline "Unparsed :\n";
  List.iter unparsed ~f:(fun (element, part, content) ->
    printf "Element %s, %s : %s\n" element part content
  )
