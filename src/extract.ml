open Core
open Printf
module Regex = Re2.Regex

(* Case-insensitive string comparator *)
module Cisc = Comparator.Make (struct
  type t = string
  let sexp_of_t = String.sexp_of_t
  let compare s s' = String.compare (String.lowercase s) (String.lowercase s')
end)
type 'a smap = (string, 'a, Cisc.comparator_witness) Map.t

type element = {
  name : string;
  categories : category list;
  contexts : context list; (* non-normative *)
  (*
  content_model : string list;
  content_attributes_groups : attribute_group list;
  content_attributes : attribute list;
  *)
}
and category = {
  name : string;
  mutable elements : element list;
}
and context =
  | Context_category of category
  | Context_element of element * bool

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

let parse_dds body =
  let r = Regex.create_exn "<dd>(?P<content>(?sU).*)</dd>" in
  Regex.find_all_exn ~sub:(`Name "content") r body

let parse_body body =
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

let add_element t name =
  let elt = { name; categories = []; contexts = [] } in
  { t with elements = Map.add t.elements name elt }

let r_category = Regex.create_exn "^<a(?:(?sU).*)href=\"#[a-zA-Z0-9,-]+\">(?P<cat>(?sU).*)</a>"
let add_categories (t, unparsed) name dds =
  let f ((t, unparsed) : t * unparsed list) dd =
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
      (* Retrieve element and add category *)
      let elt = Map.find_exn t.elements name in
      let elt = { elt with categories = cat :: elt.categories } in
      (* Add the element in each of his categories *)
      List.iter elt.categories ~f:(fun c ->
        if phys_equal c cat then c.elements <- elt :: c.elements
        else c.elements <- elt :: (List.tl_exn c.elements)
      );
      (* Add the element in the main structure *)
      ({ t with elements = Map.add t.elements name elt }, unparsed)
    else (t, (name, "category", dd) :: unparsed)
  in List.fold dds ~init:(t, unparsed) ~f

let add_context t name context =
  let elt = Map.find_exn t.elements name in
  let elt = { elt with contexts = context :: elt.contexts } in
  { t with elements = Map.add t.elements name elt }

let r_context_cat = Regex.create_exn "^Where <a href=\"#[a-zA-Z0-9,-]+\">(?P<cat>(?sU).*)</a> is expected.$"
let r_context_elt = Regex.create_exn "^As (?P<pos>a|the first) (?:element in|child of) an? <code><a href=\"#[a-zA-Z0-9,-]+\">(?P<elt>(?sU)[a-zA-Z0-9]+)</a></code> element.$"
let add_contexts (t, unparsed) name dds =
  let f ((t, unparsed) : t * unparsed list) dd =
    if Regex.matches r_context_cat dd then
      let catname = Regex.find_first_exn ~sub:(`Name "cat") r_context_cat dd in
      let cat = Map.find_exn t.categories catname in
      let context = Context_category cat in
      (add_context t name context, unparsed)
    else if Regex.matches r_context_elt dd then
      let eltname = Regex.find_first_exn ~sub:(`Name "elt") r_context_elt dd in
      print_endline eltname;
      let elt = Map.find_exn t.elements eltname in
      let first = Regex.find_first_exn ~sub:(`Name "pos") r_context_elt dd = "the first" in
      let context = Context_element (elt, first) in
      (add_context t name context, unparsed)
    else (t, (name, "context", dd) :: unparsed)
  in List.fold dds ~init:(t, unparsed) ~f

let get_names head =
  let names = Regex.get_matches_exn r_elements_names head in
  let init = [] in
  let f l m = Regex.Match.get_exn (`Name "name") m :: l in
  List.fold names ~init ~f

let handle_element_early parts (t, unparsed) name =
  let t = add_element t name in
  let (t, unparsed) = add_categories (t, unparsed) name parts.categories in
  (t, unparsed)

let handle_element_late parts (t, unparsed) name =
  let (t, unparsed) = add_contexts (t, unparsed) name parts.contexts in
  (t, unparsed)

let handle_elements (t, unparsed) names body =
  let parts = parse_body body in
  let (t, unparsed) = List.fold names ~init:(t, unparsed) ~f:(handle_element_early parts) in
  let (t, unparsed) = List.fold names ~init:(t, unparsed) ~f:(handle_element_late parts) in
  (t, unparsed)

let extract file =
  let content = In_channel.read_all file in
  let matches = Regex.get_matches_exn r_elements content in
  let elements = Map.empty ~comparator:Cisc.comparator in
  let categories = Map.empty ~comparator:Cisc.comparator in
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
  printf "INSERT INTO element_category (elt_name, cat_name) VALUES %s;\n\n" element_categories;
  List.iter (Map.data t.elements) ~f:(fun e ->
    List.iter e.contexts ~f:(function
      | Context_category cat ->
          printf
          "INSERT INTO element_context_category (elt_name, cat_name) VALUES ('%s', '%s');\n"
          e.name cat.name
      | Context_element (e', first) ->
          printf
          "INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first) VALUES ('%s', '%s', %s);\n"
          e.name e'.name (if first then "TRUE" else "FALSE")
    )
  )

let () =
  let file = Sys.argv.(1) in
  let t, unparsed = extract file in
  print_sql t;
  print_endline "Unparsed :\n";
  List.iter unparsed ~f:(fun (element, part, content) ->
    printf "Element %s, %s : %s\n" element part content
  )
