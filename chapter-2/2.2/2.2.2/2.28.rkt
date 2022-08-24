#lang sicp
(define l1 (list (list 1 2) (list 3 4)))
(define l2  (list (list 1) (list 3 4)))

(define (fringe x)
  (cond ((null? (cdr x))
         (if (pair? (car x))
             (fringe (car x))
             (list (car x))))
        ((not (pair? (car x))) (append (list (car x)) (fringe (cdr x))))
        (else (append (fringe (car x)) (fringe (cdr x))))))
                          

(fringe l1)
(fringe (list l1 l1))
(fringe l2)
(fringe (list l1 l2))
(fringe (list l1 l1 l2))
(fringe (list l1 l2 l1 l2))