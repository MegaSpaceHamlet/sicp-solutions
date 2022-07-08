#lang sicp
(#%require "2.1.4-extended-exercise.rkt")

(define (sub-interval x y)
  (make-interval (- (upper-bound x) (upper-bound y))
                 (- (lower-bound x) (lower-bound y))))

(define a (make-interval 3.08 3.12))
(define b (make-interval 4.3 4.78))
(define c (sub-interval b a))
(print-interval c)