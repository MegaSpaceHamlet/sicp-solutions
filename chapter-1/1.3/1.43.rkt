#lang sicp
(#%require "../../functions.rkt")
(#%require "1.42.rkt") ; 'compose' procedure
(define (repeated f n)
  (define (repeat-step g i)
    (if (>= i n)
        g
        (repeat-step (compose f g) (+ i 1))))
  (repeat-step f 1))
(#%provide repeated)
