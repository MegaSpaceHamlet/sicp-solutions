#lang sicp
(#%require "sqrt.rkt" )
(define (cube x)
  (* x x x))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (improve guess x)))

(define (good-enough? guess x)
  (< (abs (/ x (sqr (cube guess)) (* guess 2))) (* guess 0.001)))

(define (improve guess x)
  (average guess (/ x guess)))

(cbrt 8)