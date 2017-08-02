open Printf
module Regex = Re2.Regex
open Core

let of_bool = function
  | true -> "TRUE"
  | false -> "FALSE"

let comment s =
  let r = Regex.create_exn "\n" in
  "-- " ^ Regex.replace_exn ~f:(fun _ -> "\n  -- ") r s

let tab l = String.concat ~sep:", " l

let of_position = function
  | Extract.Pos_first -> "first"
  | Extract.Pos_second -> "second"
  | Extract.Pos_firstlast -> "first or last"
  | Extract.Pos_any -> "any"

let print_sql_category eltname = function
  | Extract.Category (catname, prov) ->
      printf (
        "INSERT INTO element_category (elt_name, cat_name) " ^^
        "VALUES ('%s', '%s');\n%s\n"
      ) eltname catname (comment prov)
  | Extract.Category_has_elts (catname, l, prov) ->
      printf (
        "INSERT INTO element_category_has_elts (elt_name, cat_name, ele_elts) " ^^
        "VALUES ('%s', '%s', '{%s}');\n%s\n"
      ) eltname catname (tab l) (comment prov)
  | Extract.Category_has_attr (catname, attrname, prov) ->
      printf (
        "INSERT INTO element_category_has_attr (elt_name, cat_name, att_name) " ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname catname attrname (comment prov)
  | Extract.Category_attr_is (catname, attrname, value, neg, prov) ->
      printf (
        "INSERT INTO element_category_value " ^^
        "(elt_name, cat_name, att_name, ecv_value, ecv_neg) " ^^
        "VALUES ('%s', '%s', '%s', '%s', %s);\n%s\n"
      ) eltname catname attrname value (of_bool neg) (comment prov)
  | Extract.Category_no_descendant (catname, e, prov) ->
      printf (
        "INSERT INTO element_category_no_descendant " ^^
        "(elt_name, cat_name, eld_elt)" ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname catname e (comment prov)

let print_sql_context eltname = function
  | Extract.Context_category (cat, prov) ->
      printf (
        "INSERT INTO element_context_category (elt_name, cat_name) " ^^
        "VALUES ('%s', '%s');\n%s\n"
      ) eltname cat (comment prov)
  | Extract.Context_element (e', pos, once, prov) ->
      printf (
        "INSERT INTO element_context_child_of " ^^
        "(elt_name, ecc_child_of, ecc_position, ecc_once) " ^^
        "VALUES ('%s', '%s', '%s', %s);\n%s\n"
      ) eltname e' (of_position pos) (of_bool once) (comment prov)
  | Extract.Context_root prov ->
      printf (
        "INSERT INTO element_context_root (elt_name) " ^^
        "VALUES ('%s');\n%s\n"
      ) eltname (comment prov)
  | Extract.Context_subdocument prov ->
      printf (
        "INSERT INTO element_context_subdocument (elt_name) " ^^
        "VALUES ('%s');\n%s\n"
      ) eltname (comment prov)
  | Extract.Context_subelement (elt, sub, prov) ->
      printf (
        "INSERT INTO element_context_subelement " ^^
        "(elt_name, ecs_elt, ecs_sub) " ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname elt sub (comment prov)
  | Extract.Context_between (parent, before, after, prov) ->
      printf (
        "INSERT INTO element_context_between " ^^
        "(elt_name, ecb_parent, ecb_before, ecb_after) " ^^
        "VALUES ('%s', '%s', '{%s}', '{%s}');\n%s\n"
      ) eltname parent (tab before) (tab after) (comment prov)
  | Extract.Context_child_no_attr (parent, attr, prov) ->
      printf (
        "INSERT INTO element_context_child_no_attr " ^^
        "(elt_name, cna_parent, att_name) " ^^
        "VALUES ('%s', '%s', '%s');\n%s\n"
      ) eltname parent attr (comment prov)

let print_sql_model eltname = function
  | Extract.Model_empty prov ->
      printf (
        "INSERT INTO element_model_empty (elt_name) VALUES ('%s');\n%s\n"
      ) eltname (comment prov)
  | Extract.Model_category (cat, prov) ->
      printf (
        "INSERT INTO element_model_category (elt_name, cat_name) " ^^
        "VALUES ('%s', '%s');\n%s\n"
      ) eltname cat (comment prov)

let print_sql t =
  List.iter (Map.keys t.Extract.elements) ~f:(
    printf "INSERT INTO element (elt_name) VALUES ('%s');\n"
  );
  printf "\n";
  List.iter (Map.keys t.Extract.categories) ~f:(
    printf "INSERT INTO category (cat_name) VALUES ('%s');\n"
  );
  printf "\n";
  List.iter (Map.data t.Extract.elements) ~f:(fun elt ->
    List.iter elt.Extract.categories ~f:(print_sql_category elt.Extract.elt_name)
  );
  printf "\n";
  List.iter (Map.data t.Extract.elements) ~f:(fun elt ->
    List.iter elt.Extract.contexts ~f:(print_sql_context elt.Extract.elt_name)
  );
  printf "\n";
  List.iter (Map.data t.Extract.elements) ~f:(fun elt ->
    List.iter elt.Extract.content_model ~f:(print_sql_model elt.Extract.elt_name)
  );
  printf "\n";
  List.iter (t.Extract.unparsed) ~f:(fun (elt, sec, dd) ->
    let text = Regex.replace_exn ~f:(fun _ -> "''") (Regex.create_exn "'") dd in
    printf (
      "INSERT INTO unparsed (elt_name, unp_section, unp_text) " ^^
      "VALUES ('%s', '%s', '%s');\n"
    ) elt sec text
  )

let () =
  let file = Sys.argv.(1) in
  let t = Extract.extract file in
  print_sql t

