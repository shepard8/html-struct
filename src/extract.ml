(* TODO Cisc is no longer needed *)

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

type s_element = string
type s_category = string
type s_attribute = string

type provenance = string (* The html fragment between <dd> and </dd> which led
to the construct it is attached to. *)

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
and elt_context =
  | Context_root of provenance
  | Context_subdocument of provenance
  | Context_category of s_category * provenance
  | Context_element of s_element * bool * bool * provenance (* first * once *)
  | Context_subelement of s_element * s_element * provenance

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
  | Context_subelement _ -> t
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
    e |> ds |> one_of ["As a "; "As the first "; "Inside "] |>
    one_of ["element in a "; "element in an "; "child of a "; "child of an "; ""] |>
    elt |> one_of [" element."; " elements."] |> de
  ) (fun first _ eltname _ ->
    let first : bool = first = "As the first " in
    let context = Context_element (eltname, first, false, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "In a " |> elt |> txt " element containing no other " |>
    elt |> txt " elements." |> de
  ) (fun eltname elt_name' ->
    assert (elt_name = elt_name');
    let context = Context_element (eltname, false, true, dd) in
    add_context t elt_name context
  ) dd);

  (fun dd -> first_match (
    e |> ds |> txt "In a " |> elt |> txt " element that is a child of a " |>
    elt |> txt " element." |> de
  ) (fun eltname subname ->
    let context = Context_subelement (eltname, subname, dd) in
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
  let elements = Map.empty ~comparator:Cisc.comparator in
  let categories = Map.empty ~comparator:Cisc.comparator in
  let t = { elements; categories; unparsed = [] } in
  let f t (elt_name, parts) =
    let t = add_element t elt_name in
    let t = add_categories t elt_name parts.categories in
    let t = add_contexts t elt_name parts.contexts in
    t
  in
  List.fold name_parts ~init:t ~f

let sql_of_bool = function
  | true -> "TRUE"
  | false -> "FALSE"

let comment_sql s =
  let r = Regex.create_exn "\n" in
  "-- " ^ Regex.replace_exn ~f:(fun _ -> "\n  -- ") r s

let print_sql_category eltname = function
  | Category (catname, prov) ->
      printf (
        "INSERT INTO element_category (elt_name, cat_name) " ^^
        "VALUES ('%s', '%s');\n%s\n"
      ) eltname catname (comment_sql prov)
  | Category_has_elts (catname, l, prov) ->
      let elts = String.concat ~sep:", " l in
      printf (
        "INSERT INTO element_category_has_elts (elt_name, cat_name, ele_elts) " ^^
        "VALUES ('%s', '%s', '{%s}');\n%s\n"
      ) eltname catname elts (comment_sql prov)
  | Category_has_attr (catname, attrname, prov) ->
      printf (
        "INSERT INTO element_category_has_attr (elt_name, cat_name, att_name) " ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname catname attrname (comment_sql prov)
  | Category_attr_is (catname, attrname, value, neg, prov) ->
      printf (
        "INSERT INTO element_category_value " ^^
        "(elt_name, cat_name, att_name, ecv_value, ecv_neg) " ^^
        "VALUES ('%s', '%s', '%s', '%s', %s);\n%s\n"
      ) eltname catname attrname value (sql_of_bool neg) (comment_sql prov)

let print_sql_context eltname = function
  | Context_category (cat, prov) ->
      printf (
        "INSERT INTO element_context_category (elt_name, cat_name) " ^^
        "VALUES ('%s', '%s');\n%s\n"
      ) eltname cat (comment_sql prov)
  | Context_element (e', first, once, prov) ->
      printf (
        "INSERT INTO element_context_child_of " ^^
        "(elt_name, ecc_child_of, ecc_first, ecc_once) " ^^
        "VALUES ('%s', '%s', %s, %s);\n%s\n"
      ) eltname e' (sql_of_bool first) (sql_of_bool once) (comment_sql prov)
  | Context_root prov ->
      printf (
        "INSERT INTO element_context_root (elt_name) " ^^
        "VALUES ('%s');\n%s\n"
      ) eltname (comment_sql prov)
  | Context_subdocument prov ->
      printf (
        "INSERT INTO element_context_subdocument (elt_name) " ^^
        "VALUES ('%s');\n%s\n"
      ) eltname (comment_sql prov)
  | Context_subelement (elt, sub, prov) ->
      printf (
        "INSERT INTO element_context_subelement " ^^
        "(elt_name, ecs_elt, ecs_sub) " ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname elt sub (comment_sql prov)

let print_sql t =
  List.iter (Map.keys t.elements) ~f:(
    printf "INSERT INTO element (elt_name) VALUES ('%s');\n"
  );
  printf "\n";
  List.iter (Map.keys t.categories) ~f:(
    printf "INSERT INTO category (cat_name) VALUES ('%s');\n"
  );
  printf "\n";
  List.iter (Map.data t.elements) ~f:(fun elt ->
    List.iter elt.categories ~f:(print_sql_category elt.elt_name)
  );
  printf "\n";
  List.iter (Map.data t.elements) ~f:(fun elt ->
    List.iter elt.contexts ~f:(print_sql_context elt.elt_name)
  );
  printf "\n";
  List.iter (t.unparsed) ~f:(fun (elt, sec, dd) ->
    let text = Regex.replace_exn ~f:(fun _ -> "''") (Regex.create_exn "'") dd in
    printf (
      "INSERT INTO unparsed (elt_name, unp_section, unp_text) " ^^
      "VALUES ('%s', '%s', '%s');\n"
    ) elt sec text
  )

let () =
  let file = Sys.argv.(1) in
  let t = extract file in
  print_sql t

