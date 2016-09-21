#!r6rs

(import (rnrs))          ;  Importation en vrac de tous les modules de la
                         ;  bibliotheque initiale: nous verrons plus tard
                         ;  comment proceder plus precisement. Comme vous
                         ;  l'avez devine, ceci est un commentaire.

;(write (+ 2016 (* (+ 22 1) (/ 14 (- 9 2)))))  ;  (*)

;(newline)
;(write "Hello world!")
;(newline)
;(display "Hello world!")
;(newline)

;(write ((lambda (x) (* x x)) 2015))  ;  (**)

;(newline)

(define crash          ;  (***)  Pour bien montrer que Scheme n'evalue pas sous
  (lambda () (/ 0)))   ;  la forme speciale "lambda".

(define derive-wrt
  (lambda (f1 h)
    (lambda (x) (/ (- (f1 (+ x h)) (f1 x)) h))))

;(write ((derive-wrt (lambda (x) (* x x)) 0.0001) 2))
;(newline)

;(write ((derive-wrt + 0.0001) 2))  ;  (****)

(define fact
  (lambda (n) (if (zero? n) 1 (* n (fact (- n 1))))))

;(newline)
;(write (fact 6))
;(newline)

(define pi (* 4 (atan 1)))  ;  "atan" est la fonction "Arc tangente" en Scheme.

(define power
  (lambda (U I f0) (* U I (cos (* 2 pi f0)))))

(define fq->power
  (lambda (f0)
    (let ((coefficient (cos (* 2 pi f0))))
      (lambda (U I) (* coefficient U I)))))

(define average
  (lambda (x y) (/ (+ x y) 2.0)))

(define closeenough?
  (lambda (x y epsilon)
    (if(< (abs (- x y)) epsilon) #t #f)))

(define look-for-root)