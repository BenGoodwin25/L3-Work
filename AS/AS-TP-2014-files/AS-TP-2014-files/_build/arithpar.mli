
(* The type of tokens. *)

type token = 
  | VAR of (string)
  | TRUE
  | TIMES
  | STRING of (string)
  | SEMI
  | PO
  | PLUS
  | PF
  | OR
  | NOT
  | NEQ
  | MINUS
  | LT
  | LEQ
  | INT of (int)
  | GT
  | GEQ
  | FLOAT of (float)
  | FALSE
  | EQ
  | EOF
  | DIVIDE
  | CO
  | CF
  | AND
  | AFFECT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val start1: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t)

val start: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t)
