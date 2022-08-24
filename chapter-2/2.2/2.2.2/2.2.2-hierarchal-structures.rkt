#lang sicp
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define l1 (list 1 2 (list 3 4) 5))
(define l2 (list (list 1) (list 2) (list 3) (list 4) (list 5)))
(define l3 (list (list 1 2 3 4) (list 5)))
(define l4 (list 1 2 3 4 5))

(for-each (lambda (l) (display (count-leaves l)) (newline))
          (list l1 l2 l3 l4))
