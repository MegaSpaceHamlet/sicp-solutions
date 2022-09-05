#lang sicp
(#%require "../../../list-functions.rkt")

(define fold-right accumulate)

(define (reverse sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil
              sequence))

(define sequence (list 1 2 3 4))

(reverse sequence)

(define (left-reverse sequence)
  (fold-left (lambda (x y)
               (cons y x))
             nil
             sequence))
(left-reverse sequence)
             