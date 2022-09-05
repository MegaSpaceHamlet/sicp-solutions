#lang sicp
(#%require "../../../list-functions.rkt")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (l)
                               (if (pair? l)
                                   (count-leaves l)
                                   1))
                             t)))

(define t1 (list (list 1 2) (list 3 4) (list 5 6) 7 8))
(define t2 (list 1 2 3 4))
(define t3 (list 1 (list 2 (list 3 (list 4)))))
(define t4 (list (list 4 3) (list 2 1)))
(for-each (lambda (t) (display (count-leaves t)) (newline)) (list t1 t2 t3 t4))