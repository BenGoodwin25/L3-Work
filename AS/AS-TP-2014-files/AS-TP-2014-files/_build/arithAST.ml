open List
open Helper

(******************************)

type op = Plus | Times | Minus | Divide |
  Equal | Different | LessThan | GreaterThan | LessThanEq | GreaterThanEq |
  And | Or 
type uop = UMinus | Not

type t =
  | Int of int
  | Float of float
  | String of string
  | Var of string
  | Bin of op * t * t
  | Un  of uop * t
  | Dummy of string * t list (* put a bunch of trees together *)


let str_of_op = function
  | Plus -> "+"
  | Times -> "*"
  | Minus -> "-"
  | Divide -> "/"
  | Equal -> "=="
  | Different -> "<>"
  | LessThan -> "<"
  | GreaterThan -> ">"
  | LessThanEq -> "<="
  | GreaterThanEq  -> ">="
  | And -> "&&"
  | Or -> "||"
  
let str_of_uop = function UMinus -> "-" | Not -> "~"

(* convert into DOT format *)
let rec dot = function
  | Int i -> Dot.N ("i:" ^ soi i, [])
  | String s -> Dot.N ("s:" ^ String.escaped s, [])
  | Var s -> Dot.N ("v:" ^ String.escaped s, [])
  | Float f -> Dot.N ("f:" ^ sof f, [])
  | Bin (o,l,r) -> Dot.N (str_of_op o, [dot l; dot r])
  | Un (o,t) -> Dot.N (str_of_uop o, [dot t])
  | Dummy (s,l) -> Dot.N (spf "<%s>" s, map dot l)

