open Printf
module Regex = Re2.Regex

type (_, _) c =
  | Empty : ('a, 'a) c
  | Cons : (string -> 'a, 'b) c -> ('a, 'b) c

type ('a, 'b) t = (('a, 'b) c * string * int)

let capture (s, r, i) re = (Cons s, r ^ sprintf re i, i + 1)

let e = (Empty, "", 0)
let ds (s, r, i) = (s, r ^ "^", i)
let de (s, r, i) = (s, r ^ "$", i)
let txt t (s, r, i) = (s, r ^ Regex.escape t, i)
let elt t = capture t (
  "<code><a href=\"#(?P<%d>[a-zA-Z0-9,-]+)\">" ^^
  "(?:(?sU)[a-zA-Z0-9,-]+)" ^^
  "</a></code>"
)
let cat t = capture t (
  "<a (?:data-anolis-xref=\"[a-zA-Z0-9, -]+\" |)href=\"#(?P<%d>[a-zA-Z0-9,-]+)\">" ^^
  "(?:(?sU).*)" ^^
  "</a>"
)
let att t = capture t (
  (* TODO can we add attr- in the <%d> group? *)
  "<code data-anolis-xref=\"[a-zA-Z0-9,-]+\"><a href=\"#(?P<%d>[a-zA-Z0-9,-]+)\">" ^^
  "(?:(?sU).*)" ^^
  "</a></code>"
)
let con t = capture t (
  "<a data-anolis-xref=\"[a-zA-Z0-9 ,-]+\" href=\"#(?P<%d>[a-zA-Z0-9()= ,-]+)\">" ^^
  "[a-zA-Z0-9, -]+" ^^
  "</a>"
)
let neg t = capture t (
  "(?P<%d><em>not</em> |)"
)
let all t = capture t (
  "(?P<%d>(?s).*)"
)

let parse : type b. (_, b) c -> _ -> _ -> b -> _ -> _ = fun st re i f s ->
  let rec aux : type a. ((a, b) c * int) -> a = fun (st, i) -> match st with
  | Empty -> f
  | Cons st ->
      let name = string_of_int i in
      let arg = Regex.find_first_exn ~sub:(`Name name) re s in
      (aux (st, i - 1)) arg
  in aux (st, i)

let first_match (s, r, i) f txt =
  let re = Regex.create_exn r in
  if Regex.matches re txt
  then Some (parse s re (i - 1) f txt)
  else None

let all_of capturer txt =
  let (_, r, _) = e |> capturer in
  let re = Regex.create_exn r in
  Regex.find_all_exn ~sub:(`Name "0") re txt

