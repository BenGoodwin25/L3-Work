#!r6rs

(import (rnrs))

(define derive-wrt
  (lambda (fi h)
    (lambda (x) (/ (- (f1 (+ x h)) (f1 x)) h))))