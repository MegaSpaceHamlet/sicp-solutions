#lang sicp
(#%require "../../functions.rkt")
(#%require "1.3.3-fixed-point.rkt") ; fixed-point
(#%require "1.3.4-procedures-as-returned-values.rkt") ; average-damp
(#%require "1.43.rkt") ; repeated

(define (fourth-root x)
  (fixed-point ((repeated average-damp 2)
                (lambda (y) (/ x (expt y 3))))
                1.0))

; Need to test the requirements for damping
(define (nth-root x n)
  (fixed-point ((repeated average-damp 3)
                (lambda (y) (/ x (expt y (- n 1)))))
                1.0))