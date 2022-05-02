#lang sicp
(#%require "../../functions.rkt")
(#%require "1.43.rkt") ;repeated
(#%require "1.40.rkt") ;cubic

(define dx 0.0001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smoothed f n)
  ((repeated smooth n) f))
