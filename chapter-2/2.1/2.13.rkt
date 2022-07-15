#lang sicp
(#%require "2.1.4-extended-exercise.rkt")
(#%require "2.12.rkt") ; make-center-percent,percent
(define (product-of-small-percentages a b)
  (+ (percent a) (percent b)))

(define prod (percent (mul-interval i ip)))
(define prod-percent (product-of-small-percentages i ip))
(define prod2 (percent (mul-interval a b)))
(define prod-percent2 (product-of-small-percentages a b))