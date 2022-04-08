#lang sicp
(#%require "../../functions.rkt")
(#%require "1.43.rkt") ;repeated
(#%require "1.40.rkt") ;cubic

(define (smooth f)
    (lambda (x)
      (/ 3 (+ (f (- x dx)) (f x) (f (+ x dx))))))

(define my-cubic (cubic 1 -7 0))

(define smoothen-that-cube (smooth my-cubic))