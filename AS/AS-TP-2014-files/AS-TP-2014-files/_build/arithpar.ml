
exception Error

let _eRR =
  Error

type token = 
  | VAR of (string)
  | TIMES
  | STRING of (string)
  | PLUS
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
  | EQ
  | EOF
  | DIVIDE
  | AND

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState58
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState45
  | MenhirState43
  | MenhirState39
  | MenhirState34
  | MenhirState31
  | MenhirState29
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState11
  | MenhirState4
  | MenhirState3
  | MenhirState0
  
 
 
(** parser *)

open ArithAST


let rec _menhir_goto_manual_arith_plus_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 57:\n%!";
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 61\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 61:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production start1 -> int_plus_left int_plus_right manual_arith_plus_r manual_arith_plus_l EOF \n%!";
        let ((((_menhir_stack, _1), _, _2), _, _3), _, _4) = _menhir_stack in
        let _5 = () in
        let _v : (ArithAST.t) = ( Dummy ("assocs and precs", [_1;_2;_3;_4]) ) in
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 38:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _1 = _v in
        Printf.fprintf Pervasives.stderr "Accepting\n%!";
        Obj.magic _1
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 58\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 58:\n%!";
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 55:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_goto_manual_arith_plus_r : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 49:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_plus_r -> manual_arith_times_r PLUS manual_arith_plus_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Plus, l,r) ) in
        _menhir_goto_manual_arith_plus_r _menhir_env _menhir_stack _menhir_s _v
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 53:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | _ ->
        _menhir_fail ()

and _menhir_goto_manual_arith_times_l : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 54:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 55\n%!";
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
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
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 59:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 55\n%!";
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
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
    | MenhirState48 | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 47:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 48\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 48:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
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
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 52:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_r -> manual_arith_atom TIMES manual_arith_times_r \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_r _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 46:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = _v in
    Printf.fprintf Pervasives.stderr "Reducing production manual_arith_atom -> INT \n%!";
    let _v : (ArithAST.t) =                                                     ( Int _1 ) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState45 | MenhirState51 | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 50:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 51\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 51:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
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
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 56:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production manual_arith_times_l -> manual_arith_times_l TIMES manual_arith_atom \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                                                     ( Bin (Times, l,r) ) in
        _menhir_goto_manual_arith_times_l _menhir_env _menhir_stack _menhir_s _v
    | MenhirState53 | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 60:\n%!";
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

and _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 11:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 13:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 19:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 21:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 23:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 25:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 27:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 29:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 31:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    Printf.fprintf Pervasives.stderr "State 15:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_goto_int_plus_right : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 44:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production int_plus_right -> INT PLUS int_plus_right \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                               ( Bin (Plus, Int l, r) ) in
        _menhir_goto_int_plus_right _menhir_env _menhir_stack _menhir_s _v
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 45:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 46\n%!";
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
    | _ ->
        _menhir_fail ()

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 7:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> MINUS expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _1 = () in
        let _v : (ArithAST.t) =                         ( Un (UMinus,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 8:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> NOT expr \n%!";
        let ((_menhir_stack, _menhir_s), _, t) = _menhir_stack in
        let _1 = () in
        let _v : (ArithAST.t) =                         ( Un (Not,t) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 10:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AND ->
            Printf.fprintf Pervasives.stderr "Shifting (AND) to state 34\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 34:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            Printf.fprintf Pervasives.stderr "Shifting (EOF) to state 33\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 33:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "Reducing production start -> expr EOF \n%!";
            let (_menhir_stack, _menhir_s, _1) = _menhir_stack in
            let _2 = () in
            let _v : (ArithAST.t) =                 ( _1 ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 9:\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            let _1 = _v in
            Printf.fprintf Pervasives.stderr "Accepting\n%!";
            Obj.magic _1
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | OR ->
            Printf.fprintf Pervasives.stderr "Shifting (OR) to state 17\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 17:\n%!";
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FLOAT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | INT _v ->
                Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | MINUS ->
                Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | NOT ->
                Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | STRING _v ->
                Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | VAR _v ->
                Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 12:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr TIMES expr \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                         ( Bin (Times, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 14:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS ->
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
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 16:\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "Reducing production expr -> expr DIVIDE expr \n%!";
        let ((_menhir_stack, _menhir_s, l), _, r) = _menhir_stack in
        let _2 = () in
        let _v : (ArithAST.t) =                         ( Bin (Divide, l, r) ) in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 18:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | OR ->
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
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 20:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | NEQ | OR ->
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
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 22:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | MINUS | NEQ | OR | PLUS ->
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
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 24:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR ->
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
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 26:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR ->
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
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 28:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR ->
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
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 30:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | GEQ | GT | LEQ | LT | NEQ | OR ->
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
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 32:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | EQ | NEQ | OR ->
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
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 35:\n%!";
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDE ->
            Printf.fprintf Pervasives.stderr "Shifting (DIVIDE) to state 15\n%!";
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | EQ ->
            Printf.fprintf Pervasives.stderr "Shifting (EQ) to state 31\n%!";
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | GEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (GEQ) to state 29\n%!";
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            Printf.fprintf Pervasives.stderr "Shifting (GT) to state 27\n%!";
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | LEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (LEQ) to state 25\n%!";
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LT ->
            Printf.fprintf Pervasives.stderr "Shifting (LT) to state 23\n%!";
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 21\n%!";
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | NEQ ->
            Printf.fprintf Pervasives.stderr "Shifting (NEQ) to state 19\n%!";
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 13\n%!";
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            Printf.fprintf Pervasives.stderr "Shifting (TIMES) to state 11\n%!";
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | AND | EOF | OR ->
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
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 42:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 43\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 43:\n%!";
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 42\n%!";
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
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

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
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
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 1:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let s = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> VAR \n%!";
    let _v : (ArithAST.t) =                         ( Var s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 2:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let s = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> STRING \n%!";
    let _v : (ArithAST.t) =                         ( String s ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 3:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    Printf.fprintf Pervasives.stderr "State 4:\n%!";
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (int) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 5:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let i = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> INT \n%!";
    let _v : (ArithAST.t) =                         ( Int i ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (float) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    Printf.fprintf Pervasives.stderr "State 6:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let f = _v in
    Printf.fprintf Pervasives.stderr "Reducing production expr -> FLOAT \n%!";
    let _v : (ArithAST.t) =                         ( Float f ) in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_int_plus_left : _menhir_env -> 'ttv_tail -> (ArithAST.t) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    Printf.fprintf Pervasives.stderr "State 39:\n%!";
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 42\n%!";
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | PLUS ->
        Printf.fprintf Pervasives.stderr "Shifting (PLUS) to state 40\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState39 in
        Printf.fprintf Pervasives.stderr "State 40:\n%!";
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | INT _v ->
            Printf.fprintf Pervasives.stderr "Shifting (INT) to state 41\n%!";
            let _menhir_stack = Obj.magic _menhir_stack in
            Printf.fprintf Pervasives.stderr "State 41:\n%!";
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    Printf.fprintf Pervasives.stderr "Lookahead token is now %s (%d-%d)\n%!" (match _tok with
    | AND ->
        "AND"
    | DIVIDE ->
        "DIVIDE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
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
    | PLUS ->
        "PLUS"
    | STRING _ ->
        "STRING"
    | TIMES ->
        "TIMES"
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
    | FLOAT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (FLOAT) to state 6\n%!";
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 5\n%!";
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | MINUS ->
        Printf.fprintf Pervasives.stderr "Shifting (MINUS) to state 4\n%!";
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NOT ->
        Printf.fprintf Pervasives.stderr "Shifting (NOT) to state 3\n%!";
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        Printf.fprintf Pervasives.stderr "Shifting (STRING) to state 2\n%!";
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | VAR _v ->
        Printf.fprintf Pervasives.stderr "Shifting (VAR) to state 1\n%!";
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        Printf.fprintf Pervasives.stderr "Initiating error handling\n%!";
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and start1 : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (ArithAST.t) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    Printf.fprintf Pervasives.stderr "State 36:\n%!";
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        Printf.fprintf Pervasives.stderr "Shifting (INT) to state 37\n%!";
        let _menhir_stack = Obj.magic _menhir_stack in
        Printf.fprintf Pervasives.stderr "State 37:\n%!";
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
  

