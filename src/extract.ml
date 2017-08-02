open Core
open Printf
module Regex = Re2.Regex

(* Case-insensitive string comparator *)
type 'a smap = 'a String.Map.t

type s_element = string
type s_category = string
type s_attribute = string

type provenance = string (* The html fragment between <dd> and </dd> which led
to the construct it is attached to. *)

type position = Pos_first | Pos_second | Pos_firstlast | Pos_any

type element = {
  elt_name : string;
  categories : elt_category list;
  contexts : elt_context list; (* non-normative *)
  (*
  content_model : string list;
  content_attributes_groups : attribute_group list;
  content_attributes : attribute list;
  *)
}
and category = {
  cat_name : string;
  mutable elements : s_element list;
}
and elt_category =
  | Category of s_category * provenance
  | Category_has_elts of s_category * s_element list * provenance
  | Category_has_attr of s_category * s_attribute * provenance
  | Category_attr_is of s_category * s_attribute * string * bool * provenance
  | Category_no_descendant of s_category * s_element * provenance
and elt_context =
  | Context_root of provenance
  | Context_subdocument of provenance
  | Context_category of s_category * provenance
  | Context_element of s_element * position * bool * provenance (* bool : once *)
  | Context_subelement of s_element * s_element * provenance
  | Context_between of s_element * s_element list * s_element list * provenance

type unparsed = s_element * string * string

type t = {
  elements : element smap;
  categories : category smap;
  unparsed : unparsed list;
}

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

let r_dd = Regex.create_exn "<dd>(?P<content>(?sU).*)</dd>"
let r_spaces = Regex.create_exn "[ \t\r\n]+"
let r_spaces_be = Regex.create_exn "^[ \t\r\n]+|[ \t\r\n]+$"
let parse_dds body =
  Regex.find_all_exn ~sub:(`Name "content") r_dd body |>
  List.map ~f:(fun dd ->
    Regex.replace_exn ~f:(fun _ -> " ") r_spaces dd
  ) |>
  List.map ~f:(fun dd ->
    Regex.replace_exn ~f:(fun _ -> "") r_spaces_be dd
  )

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

let add_element t elt_name =
  let elt = { elt_name; categories = []; contexts = [] } in
  { t with elements = Map.add t.elements elt_name elt }

let add_unparsed t u = { t with unparsed = u :: t.unparsed }

let ensure_category (t : t) catname =
  if Map.mem t.categories catname then t
  else
    let cat = { cat_name = catname; elements = [] } in
    { t with categories = Map.add t.categories catname cat }

let add_category t elt_name catname elt_category =
  let t = ensure_category t catname in
  let cat = Map.find_exn t.categories catname in
  let t = { t with categories = Map.add t.categories catname cat } in
  let elt = Map.find_exn t.elements elt_name in
  let elt = { elt with categories = elt_category :: elt.categories } in
  { t with elements = Map.add t.elements elt_name elt }

let l_categories elt_name t = HtmlRe.([
  (fun dd -> first_match (
    e |> ds |> txt "None." |> de
  ) (
    t
  ) dd);

  (fun dd -> first_match (
    e |> ds |> cat |> txt "." |> de
  ) (fun catname ->
    add_category t elt_name catname (Category (catname, dd))
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "If the element's children include at least one " |>
    elt |> txt " element: " |> cat |> txt "." |> de
  ) (fun eltname catname ->
    add_category t elt_name catname (Category_has_elts (catname, [eltname], dd))
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "If the element's children include at least one " |>
    txt "name-value group: " |> cat |> txt "." |> de
  ) (fun catname ->
    add_category t elt_name catname (Category_has_elts (catname, ["dt"; "dd"], dd))
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "If the element has a " |> att |> txt " attribute: " |>
    cat |> txt "." |> de
  ) (fun attname catname ->
    add_category t elt_name catname (Category_has_attr (catname, attname, dd))
  ) dd);

  (* The following one needs regular checking, as a "but" keyword could change
   * the meaning for example. The point is that several categories may be
   * listed, and the easiest way to retrieve them is just to retrieve all the
   * category uris. But this is not guaranteed to work in the future versions
   * of the specification. *)
  (fun dd -> first_match (
    e |> ds |> txt "If the " |> att |> txt " attribute is " |> neg |>
    txt "in the " |> con |> txt " state: " |> all |> de
  ) (fun attname neg con cats ->
    let neg : bool = neg = "" in
    let cats = all_of cat cats in
    List.fold_left cats ~init:t ~f:(fun t catname ->
      let category = Category_attr_is (catname, attname, con, neg, dd) in
      add_category t elt_name catname category
    )
  ) dd);

  (fun dd -> first_match (
    e |> ds |> cat |> txt ", but with no " |> elt |>
    txt " element descendants." |> de
  ) (fun catname eltname ->
    let category = Category_no_descendant (catname, eltname, dd) in
    add_category t elt_name catname category
  ) dd);

  (fun dd -> Some (add_unparsed t (elt_name, "category", dd)));
])

let add_categories t elt_name dds =
  let f (t : t) dd =
    List.find_map_exn (l_categories elt_name t) ~f:(fun f -> f dd)
  in
  List.fold dds ~init:t ~f

let add_context t elt_name context =
  let t = match context with
  | Context_category (catname, _) -> ensure_category t catname
  | Context_root _
  | Context_subdocument _
  | Context_element _
  | Context_subelement _
  | Context_between _ -> t
  in
  let elt = Map.find_exn t.elements elt_name in
  let elt = { elt with contexts = context :: elt.contexts } in
  { t with elements = Map.add t.elements elt_name elt }

let l_contexts elt_name t = HtmlRe.([
  (fun dd -> first_match (
    e |> ds |> txt "As the root element of a document." |> de
  ) (
    add_context t elt_name (Context_root dd)
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "Wherever a subdocument fragment is allowed in a compound document." |> de
  ) (
    add_context t elt_name (Context_subdocument dd)
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "Where " |> cat |> one_of [" is"; " are"] |> txt " expected." |> de
  ) (fun catname _ ->
    add_context t elt_name (Context_category (catname, dd))
  ) dd);

  (fun dd -> first_match (
    e |> ds |>
    one_of [
      "As a "; "Inside ";
      "As the first ";
      "As the second ";
      "As the first or last ";
    ] |>
    one_of [
      "element in a "; "element in an "; "child of a "; "child of an ";
      "element child of a "; ""
    ] |>
    elt |> one_of [" element."; " elements."] |> de
  ) (fun first _ eltname _ ->
    let position = match first with
    | "As the first " -> Pos_first
    | "As the second " -> Pos_second
    | "As the first or last " -> Pos_firstlast
    | _ -> Pos_any
    in
    let context = Context_element (eltname, position, false, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "In a " |> elt |> txt " element containing no other " |>
    elt |> txt " elements." |> de
  ) (fun eltname elt_name' ->
    assert (elt_name = elt_name');
    let context = Context_element (eltname, Pos_any, true, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "In a " |> elt |> txt " element that is a child of a " |>
    elt |> txt " element." |> de
  ) (fun parent subname ->
    let context = Context_subelement (parent, subname, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "As a child of a " |> elt |> txt " element, after any " |> all |>
    txt " and before any " |> all |>
    txt ", but only if there are no other " |> elt |>
    txt " elements that are children of the " |> elt |> txt " element." |> de
  ) (fun parent before after elt_name' parent' ->
    assert (elt_name = elt_name');
    assert (parent = parent');
    let before : string list = all_of elt before in
    let after : string list = all_of elt after in
    let context = Context_between (parent, before, after, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> Some (add_unparsed t (elt_name, "context", dd)));
])

let add_contexts t elt_name dds =
  let f (t : t) dd =
    List.find_map_exn (l_contexts elt_name t) ~f:(fun f -> f dd)
  in
  List.fold dds ~init:t ~f

let r_element = Regex.create_exn ("<h4 id=\"(?P<elt>the-[a-zA-Z0-9,-]+elements?)\"><span class=\"secno\">4\\.(?:(?sU).*)<dl class=\"element\">(?P<body>(?sU).*)</dl>")

let extract file =
  let content = In_channel.read_all file in
  let matches = Regex.get_matches_exn r_element content in
  let name_parts = List.map matches ~f:(fun m ->
    let eltname = Regex.Match.get_exn (`Name "elt") m in
    let body = Regex.Match.get_exn (`Name "body") m in
    let parts = parse_body body in
    (eltname, parts)
  ) in
  let elements = String.Map.empty in
  let categories = String.Map.empty in
  let t = { elements; categories; unparsed = [] } in
  let f t (elt_name, parts) =
    let t = add_element t elt_name in
    let t = add_categories t elt_name parts.categories in
    let t = add_contexts t elt_name parts.contexts in
    t
  in
  List.fold name_parts ~init:t ~f

