#lang sicp
(#%require "../../functions.rkt")
(#%require "1.42.rkt") ; 'compose' procedure
(define (repeated f n)
  (define (repeat-step g n)
    (if (= n 1)
        g
        (repeat-step (compose f g) (- n 1))))
  (repeat-step f n))