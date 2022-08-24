#lang sicp
(define l1 (list (list 1 2) (list 3 4)))
(define l2 (list 1 2 3 4))
(define l3 (list 1 2 (list 3 4)))

(define (deep-reverse x)
  (define (do-deep-reverse x y)
    (cond ((null? x) y)
          ((not (pair? (car x))) (do-deep-reverse (cdr x) (cons (car x) y)))
          (else (do-deep-reverse (cdr x) (cons (reverse (car x)) y)))))
  (do-deep-reverse x nil))

(for-each (lambda (l) (display (deep-reverse l)) (newline))
          (list l1 l2 l3))
