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
  categories : category_ list;
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
and category_ =
  | Category of category
  | Category_has_elt of category * element
(* TODO add when attributes are handled
  | Category_has_attr of category * attribute
  | Category_attr_is of category * attribute * string
*)
and context =
  | Context_root
  | Context_subdocument
  | Context_category of category
  | Context_element of element * bool * bool (* first * once *)
  | Context_subelement of element * element

type unparsed = string * string * string

type t = {
  elements : element smap;
  categories : category smap;
  unparsed : unparsed list;
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

let add_element t name =
  let elt = { name; categories = []; contexts = [] } in
  { t with elements = Map.add t.elements name elt }

let add_unparsed t u = { t with unparsed = u :: t.unparsed }

let sr_element name =
  sprintf "<code><a href=\"#[a-zA-Z0-9,-]+\">%s</a></code>" name

let sr_capture_element name =
  sprintf (
    "<code><a href=\"#[a-zA-Z0-9,-]+\">" ^^
    "(?P<%s>(?sU).*)" ^^
    "</a></code>"
  ) name

let sr_capture_category name =
  sprintf (
    "<a href=\"#[a-zA-Z0-9,-]+\">" ^^
    "(?P<%s>(?sU).*)" ^^
    "</a>"
  ) name

let r_category = Regex.create_exn "^<a(?:(?sU).*)href=\"#[a-zA-Z0-9,-]+\">(?P<cat>(?sU).*)</a>"
let r_category_has_elt = Regex.create_exn ("^If the element's children include at least one " ^ sr_capture_element "elt" ^ " element: " ^ sr_capture_category "cat" ^ "\.$")
let add_categories t name dds =
  let f (t : t) dd =
    if dd = "None." then t
    else if Regex.matches r_category dd then
      (* Add category to t *)
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
      let elt = { elt with categories = Category cat :: elt.categories } in
      (* Add the element in each of his categories *)
      List.iter elt.categories ~f:(function
      | Category c when phys_equal c cat -> c.elements <- elt :: c.elements
      | Category c -> c.elements <- elt :: (List.tl_exn c.elements)
      | Category_has_elt (c, _) -> c.elements <- elt :: (List.tl_exn c.elements)
      );
      (* Add the element in the main structure *)
      { t with elements = Map.add t.elements name elt }
    else if Regex.matches r_category_has_elt dd then begin
      let eltname = Regex.find_first_exn ~sub:(`Name "elt") r_category_has_elt dd in
      let catname = Regex.find_first_exn ~sub:(`Name "cat") r_category_has_elt dd in
      let t =
        if Map.mem t.categories catname
        then t
        else
          let cat = { name = catname; elements = [] } in
          { t with categories = Map.add t.categories catname cat }
      in
      let cat = Map.find_exn t.categories catname in
      let elt = Map.find_exn t.elements name in
      let elt' = Map.find_exn t.elements eltname in
      let elt = { elt with categories = Category_has_elt (cat, elt') :: elt.categories } in
      List.iter elt.categories ~f:(function
        | Category c -> c.elements <- elt :: (List.tl_exn c.elements)
        | Category_has_elt (c, _) when phys_equal c cat -> c.elements <- elt :: c.elements
        | Category_has_elt (c, _) -> c.elements <- elt :: (List.tl_exn c.elements)
      );
      { t with elements = Map.add t.elements name elt }
    end
    else add_unparsed t (name, "category", dd)
  in List.fold dds ~init:t ~f

let add_context t name context =
  let elt = Map.find_exn t.elements name in
  let elt = { elt with contexts = context :: elt.contexts } in
  { t with elements = Map.add t.elements name elt }

let r_context_cat = Regex.create_exn "^Where <a href=\"#[a-zA-Z0-9,-]+\">(?P<cat>(?sU).*)s?</a> (?:is|are) expected.$"
let r_context_elt = Regex.create_exn "^(?P<pos>As a|As the first|Inside)(?: element in an?| child of an?|) <code><a href=\"#[a-zA-Z0-9,-]+\">(?P<elt>(?sU)[a-zA-Z0-9]+)</a></code> elements?.$"
let r_context_once elt = Regex.create_exn ("^In a " ^ sr_capture_element "elt" ^ " element containing no other " ^ sr_element elt ^ " elements.$")
let r_context_subelt = Regex.create_exn ("^In a " ^ sr_capture_element "elt" ^ " element that is a child of a " ^ sr_capture_element "sub" ^ " element.$")
let add_contexts t name dds =
  let f (t : t) dd =
    if dd = "As the root element of a document." then
      add_context t name Context_root
    else if dd = "Wherever a subdocument fragment is allowed in a compound document." then
      add_context t name Context_subdocument
    else if Regex.matches r_context_cat dd then
      let catname = Regex.find_first_exn ~sub:(`Name "cat") r_context_cat dd in
      let cat = Map.find_exn t.categories catname in
      let context = Context_category cat in
      add_context t name context
    else if Regex.matches r_context_elt dd then
      let eltname = Regex.find_first_exn ~sub:(`Name "elt") r_context_elt dd in
      let elt = Map.find_exn t.elements eltname in
      let first = Regex.find_first_exn ~sub:(`Name "pos") r_context_elt dd = "As the first" in
      let context = Context_element (elt, first, false) in
      add_context t name context
    else if Regex.matches (r_context_once name) dd then
      let eltname = Regex.find_first_exn ~sub:(`Name "elt") (r_context_once name) dd in
      let elt = Map.find_exn t.elements eltname in
      let context = Context_element (elt, false, true) in
      add_context t name context
    else if Regex.matches r_context_subelt dd then
      let eltname = Regex.find_first_exn ~sub:(`Name "elt") r_context_subelt dd in
      let subname = Regex.find_first_exn ~sub:(`Name "sub") r_context_subelt dd in
      let elt = Map.find_exn t.elements eltname in
      let sub = Map.find_exn t.elements subname in
      let context = Context_subelement (elt, sub) in
      add_context t name context
    else add_unparsed t (name, "context", dd)
  in List.fold dds ~init:t ~f

let get_names head =
  let names = Regex.get_matches_exn r_elements_names head in
  let init = [] in
  let f l m = Regex.Match.get_exn (`Name "name") m :: l in
  List.fold names ~init ~f

let extract file =
  let content = In_channel.read_all file in
  let matches = Regex.get_matches_exn r_elements content in
  let name_parts = List.fold matches ~init:[] ~f:(fun acc m ->
    let head = Regex.Match.get_exn (`Name "head") m in
    let body = Regex.Match.get_exn (`Name "body") m in
    let names = get_names head in
    let parts = parse_body body in
    List.map names ~f:(fun name -> (name, parts)) @ acc
  ) in
  let elements = Map.empty ~comparator:Cisc.comparator in
  let categories = Map.empty ~comparator:Cisc.comparator in
  let t = { elements; categories; unparsed = [] } in
  let first_pass t (name, parts) =
    let t = add_element t name in
    let t = add_categories t name parts.categories in
    t
  in
  let second_pass t (name, parts) =
    let t = add_contexts t name parts.contexts in
    t
  in
  let t = List.fold name_parts ~init:t ~f:first_pass in
  let t = List.fold name_parts ~init:t ~f:second_pass in
  t

let print_sql t =
  let elements = String.concat ~sep:", " (List.map (Map.keys t.elements) ~f:(sprintf "('%s')")) in
  printf "INSERT INTO element (elt_name) VALUES %s;\n\n" elements;
  let categories = String.concat ~sep:", " (List.map (Map.keys t.categories) ~f:(sprintf "('%s')")) in
  printf "INSERT INTO category (cat_name) VALUES %s;\n\n" categories;
  let element_categories = String.concat ~sep:", " (List.concat (List.map (Map.data t.elements) ~f:(fun e ->
    List.map e.categories ~f:(function
      | Category c -> sprintf "('%s', '%s', NULL)" e.name c.name
      | Category_has_elt (c, e') -> sprintf "('%s', '%s', '%s')" e.name c.name e'.name
    )
  ))) in
  printf "INSERT INTO element_category (elt_name, cat_name, elc_has_elt) VALUES %s;\n\n" element_categories;
  List.iter (Map.data t.elements) ~f:(fun e ->
    List.iter e.contexts ~f:(function
      | Context_category cat ->
          printf
          "INSERT INTO element_context_category (elt_name, cat_name) VALUES ('%s', '%s');\n"
          e.name cat.name
      | Context_element (e', first, once) ->
          printf
          "INSERT INTO element_context_child_of (elt_name, ecc_child_of, ecc_first, ecc_once) VALUES ('%s', '%s', %s, %s);\n"
          e.name e'.name (if first then "TRUE" else "FALSE") (if once then "TRUE" else "FALSE")
      | Context_root ->
          printf
          "INSERT INTO element_context_root (elt_name) VALUES ('%s');\n"
          e.name
      | Context_subdocument ->
          printf
          "INSERT INTO element_context_subdocument (elt_name) VALUES ('%s');\n"
          e.name
      | Context_subelement (elt, sub) ->
          printf
          "INSERT INTO element_context_subelement (elt_name, ecs_elt, ecs_sub) VALUES ('%s', '%s', '%s');\n"
          e.name elt.name sub.name
    )
  );
  let unparsed = String.concat ~sep:", " (List.map t.unparsed ~f:(fun (a, b, c) -> sprintf "('%s', '%s', '%s')\n" a b (Regex.replace_exn ~f:(fun _ -> "''") (Regex.create_exn "'") c))) in
  printf "INSERT INTO unparsed (elt_name, unp_section, unp_text) VALUES\n%s;\n\n" unparsed

let () =
  let file = Sys.argv.(1) in
  let t = extract file in
  print_sql t

