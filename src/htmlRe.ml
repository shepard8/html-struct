open Printf
module Regex = Re2.Regex

type (_, _) c =
  | Empty : ('a, 'a) c
  | Cons : (string -> 'a, 'b) c -> ('a, 'b) c

type ('a, 'b) t = (('a, 'b) c * string * int)

let re = (Empty, "", 0)
let delim_start (s, r, i) = (s, r ^ "^", i)
let delim_end (s, r, i) = (s, r ^ "$", i)
let text t (s, r, i) = (s, r ^ Regex.escape t, i)
let elt (s, r, i) =
  let sr = sprintf (
    "<code><a href=\"#(?P<%d>[a-zA-Z0-9,-]+)\">" ^^
    "(?:(?sU)[a-zA-Z0-9,-]+)" ^^
    "</a></code>"
  ) i
  in
  (Cons s, r ^ sr, i + 1)
let cat (s, r, i) =
  let sr = sprintf (
    "<a (?:data-anolis-xref=\"[a-zA-Z0-9, -]+\" |)href=\"#(?P<%d>[a-zA-Z0-9,-]+)\">" ^^
    "(?:(?sU).*)" ^^
    "</a>"
  ) i
  in
  (Cons s, r ^ sr, i + 1)

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

let () =
  let t = re |> delim_start |> elt |> text "." |> delim_end in
  match first_match t (fun e -> e) "<code><a href=\"#coucou\">asoentuh</a></code>" with
  | Some "coucou" -> print_endline ":-)"
  | None | Some _ -> print_endline ":-("

