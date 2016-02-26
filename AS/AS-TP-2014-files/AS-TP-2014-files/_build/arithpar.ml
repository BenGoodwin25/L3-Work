
exception Error

let _eRR =
  Error

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

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState78
  | MenhirState75
  | MenhirState73
  | MenhirState71
  | MenhirState68
  | MenhirState65
  | MenhirState63
  | MenhirState59
  | MenhirState48
  | MenhirState42
  | MenhirState38
  | MenhirState36
  | MenhirState34
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState22
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState2
  | MenhirState0
  
 
 
(** parser *)

open ArithAST


let rec _menhir_goto_manual_arith_plus_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 77:\n%!";
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 81\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 81:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start1 -> int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF \n%!";
        let ((((_menhir_stack, _1), _, _2), _, _3), _, _4) = _menhir_stack in
        let _5 = () in
        let _v : (ArithAST.t) = ( Dummy ("assocs and precs", [_1;_2;_3;_4]) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 58:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = _v in
        Printf.fprintf Pervasives.stderr "Accepting\n%!";
        Obj.magic _1
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 78\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 78:\n%!";
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run75 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 75:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_goto_manual_arith_plus_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 69:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r PLUS manual_arith_plus_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
        _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 73:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
    | _ ->
        _menhir_fail ()

and _menhir_goto_manual_arith_times_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 74:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 75\n%!";
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_l -> manual_arith_times_l \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_plus_l _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 79:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 75\n%!";
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack)
        | EOF | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_l -> manual_arith_plus_l PLUS manual_arith_times_l \n%!";
            let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
            _menhir_goto_manual_arith_plus_l _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_manual_arith_times_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 67:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 68\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 68:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
        | INT _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 72:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom TIMES manual_arith_times_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 66:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = _v in
    Printf.fprintf Pervasives.stderr "Reducing production manual_arith_atom -> INT \n%!";
    let _v : (ArithAST.t) =                                                     ( Int _1 ) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState65 | MenhirState71 | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 70:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 71\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 71:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
        | INT _ | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _v : (ArithAST.t) =                                                     ( _1 ) in
            _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 76:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_times_l TIMES manual_arith_atom \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | MenhirState73 | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 80:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_atom \n%!";
        let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
        let _v : (ArithAST.t) =                                                     ( _1 ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 48:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 49\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState48 in
        Printf.fprintf Pervasives.stderr "State 49:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AFFECT ->
            Printf.fprintf Pervasives.stderr "Shifting (AFFECT) to state 42\n%!";
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | EOF ->
        _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_goto_start : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 53:\n%!";
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = _v in
    Printf.fprintf Pervasives.stderr "Accepting\n%!";
    Obj.magic _1

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 15:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 17:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run22 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 22:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 24:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 26:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 28:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 30:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 32:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 34:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run36 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 36:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 19:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 38:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_goto_int_plus_right : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 64:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT PLUS int_plus_right \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                               ( Bin (Plus, Int l, r) ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 65:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 66\n%!";
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmts_inner : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 44:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let l = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts -> stmts_inner \n%!";
        let _v : (ArithAST.t) =                        ( Stmts l ) in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 45:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 46\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 46:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start -> stmts EOF \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =             ( _1 ) in
            _menhir_goto_start _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 50:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let ss = _v in
        Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> stmt SEMI stmts_inner \n%!";
        let (_menhir_stack, _menhir_s, s) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t list) =                              ( s::ss ) in
        _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 3:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO ->
        Printf.fprintf Pervasives.stderr "Shifting (CO) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
    | AND | CF | DIVIDE | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PF | PLUS | SEMI | TIMES ->
        _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 12:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> MINUS expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _1 = () in
        let _v : (ArithAST.t) =                         ( Un (UMinus,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 13:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> NOT expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _1 = () in
        let _v : (ArithAST.t) =                         ( Un (Not,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 14:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 22\n%!";
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PF ->
            Printf.fprintf Pervasives.stderr "Shifting (PF) to state 21\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 21:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> PO expr PF \n%!";
            let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (ArithAST.t) =                    ( t ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 16:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr TIMES expr \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                         ( Bin (Times, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 18:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PF | PLUS | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr PLUS expr \n%!";
            let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                         ( Bin (Plus, l, r) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 20:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr DIVIDE expr \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                         ( Bin (Divide, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 23:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr OR expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( Or )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 25:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr NEQ expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( Different )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 27:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PF | PLUS | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr MINUS expr \n%!";
            let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                         ( Bin (Minus, l, r) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 29:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr LT expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( LessThan )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 31:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr LEQ expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( LessThanEq )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 33:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr GT expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( GreaterThan )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 35:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr GEQ expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( GreaterThanEq )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 37:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | EQ | NEQ | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr EQ expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( Equal )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 39:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | AND | CF | EOF | OR | PF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> expr AND expr \n%!";
            let ((_menhir_stack, _menhir_s, l0), _, r0) = _menhir_stack in
            let _100 = () in
            let _v : (ArithAST.t) = let e =
              let r = r0 in
              let _10 = _100 in
              let l = l0 in
              let o =
                let _1 = _10 in
                        ( And )
              in
                                                      ( Bin (o, l, r) )
            in
                                    ( e ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 40:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | CF ->
            Printf.fprintf Pervasives.stderr "Shifting (CF) to state 41\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 41:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR CO expr CF \n%!";
            let ((_menhir_stack, _menhir_s, v), _, t) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (ArithAST.t) =                       ( Index(v,t) ) in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 22\n%!";
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 43:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 22\n%!";
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | EOF | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production stmt -> VAR AFFECT expr \n%!";
            let ((_menhir_stack, _menhir_s, v), _, t) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                        ( Assign(Var v,t) ) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState0 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 47:\n%!";
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EOF ->
                    Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 52\n%!";
                    let _menhir_stack = Obj.magic _menhir_stack in
                    Printf.fprintf Pervasives.stderr "State 52:\n%!";
                    let _menhir_stack = Obj.magic _menhir_stack in
                    Printf.fprintf Pervasives.stderr "Reducing production start -> stmt EOF \n%!";
                    let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
                    let _2 = () in
                    let _v : (ArithAST.t) =            ( _1 ) in
                    _menhir_goto_start _menhir_env _menhir_stack _menhir_s _v
                | SEMI ->
                    Printf.fprintf Pervasives.stderr "Shifting (SEMI) to state 48\n%!";
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState48 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                Printf.fprintf Pervasives.stderr "State 51:\n%!";
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | SEMI ->
                    Printf.fprintf Pervasives.stderr "Shifting (SEMI) to state 48\n%!";
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 54:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 38\n%!";
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 55\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 55:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start -> expr EOF \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =            ( _1 ) in
            _menhir_goto_start _menhir_env _menhir_stack _menhir_s _v
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 36\n%!";
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 34\n%!";
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 32\n%!";
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 30\n%!";
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 28\n%!";
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 26\n%!";
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 24\n%!";
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 22\n%!";
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 17\n%!";
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 62:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 63\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 63:\n%!";
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 62\n%!";
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | INT _ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT \n%!";
        let (_menhir_stack, _menhir_s, i) = _menhir_stack in
        let _v : (ArithAST.t) =                               ( Int i ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "Reducing production stmts_inner -> \n%!";
    let _v : (ArithAST.t list) =   ( [] ) in
    _menhir_goto_stmts_inner _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_reduce5 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR \n%!";
    let (_menhir_stack, _menhir_s, s) = _menhir_stack in
    let _v : (ArithAST.t) =                         ( Var s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 2:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 42:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 4:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> TRUE \n%!";
    let _1 = () in
    let _v : (ArithAST.t) =                ( True ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 5:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let s = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> STRING \n%!";
    let _v : (ArithAST.t) =                         ( String s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 6:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 7:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 8:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 9:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let i = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> INT \n%!";
    let _v : (ArithAST.t) =                         ( Int i ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (float) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 10:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let f = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FLOAT \n%!";
    let _v : (ArithAST.t) =                         ( Float f ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 11:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FALSE \n%!";
    let _1 = () in
    let _v : (ArithAST.t) =                 ( False ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_int_plus_left : _menhir_env -> 'ttv_tail -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 59:\n%!";
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 62\n%!";
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 60\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState59 in
        Printf.fprintf Pervasives.stderr "State 60:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 61\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 61:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let r = _v in
            Printf.fprintf Pervasives.stderr "Reducing production int_plus_left -> int_plus_left PLUS INT \n%!";
            let ((_menhir_stack, l), _) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                               ( Bin (Plus, l, Int r) ) in
            _menhir_goto_int_plus_left _menhir_env _menhir_stack _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    Printf.fprintf Pervasives.stderr "Lookahead token is now %s (%d-%d)\n%!" (match _tok with
    | AFFECT ->
        "AFFECT"
    | AND ->
        "AND"
    | CF ->
        "CF"
    | CO ->
        "CO"
    | DIVIDE ->
        "DIVIDE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | FALSE ->
        "FALSE"
    | FLOAT _ ->
        "FLOAT"
    | GEQ ->
        "GEQ"
    | GT ->
        "GT"
    | INT _ ->
        "INT"
    | LEQ ->
        "LEQ"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | NEQ ->
        "NEQ"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | PF ->
        "PF"
    | PLUS ->
        "PLUS"
    | PO ->
        "PO"
    | SEMI ->
        "SEMI"
    | STRING _ ->
        "STRING"
    | TIMES ->
        "TIMES"
    | TRUE ->
        "TRUE"
    | VAR _ ->
        "VAR") lexbuf.Lexing.lex_start_p.Lexing.pos_cnum lexbuf.Lexing.lex_curr_p.Lexing.pos_cnum;
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and start : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    Printf.fprintf Pervasives.stderr "State 0:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        Printf.fprintf Pervasives.stderr "Shifting (FALSE) to state 11\n%!";
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 10\n%!";
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 9\n%!";
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 8\n%!";
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 7\n%!";
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PO ->
        Printf.fprintf Pervasives.stderr "Shifting (PO) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | TRUE ->
        Printf.fprintf Pervasives.stderr "Shifting (TRUE) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState0 in
        Printf.fprintf Pervasives.stderr "State 1:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AFFECT ->
            Printf.fprintf Pervasives.stderr "Shifting (AFFECT) to state 42\n%!";
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack)
        | CO ->
            Printf.fprintf Pervasives.stderr "Shifting (CO) to state 2\n%!";
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
        | AND | DIVIDE | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS | TIMES ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | EOF ->
        _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and start1 : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    Printf.fprintf Pervasives.stderr "State 56:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 57\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 57:\n%!";
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let i = _v in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_left -> INT \n%!";
        let _v : (ArithAST.t) =                               ( Int i ) in
        _menhir_goto_int_plus_left _menhir_env _menhir_stack _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR)
  

