#lang sicp
(#%require "1.3.3-fixed-point.rkt")
(#%require "1.3.4-procedures-as-returned-values.rkt")
(#%require "1.3.4-newtons-method.rkt")

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt-half x)
  (fixed-point-of-transform (lambda (y) (/ x y))
                            average-damp
                            1.0))

(define (sqrt-newt x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(define (square x) (* x x))
                         