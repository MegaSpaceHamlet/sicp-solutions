#lang sicp
(#%require "../../functions.rkt")
(#%require "1.43.rkt") ;repeated
(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ 3 ((f (- x dx)) (f x) (f (+ x dx)))))))