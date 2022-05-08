#lang sicp
(#%require "../../functions.rkt")
(#%require "1.3.3-fixed-point.rkt") ; fixed-point
(#%require "1.3.4-procedures-as-returned-values.rkt") ; average-damp
(#%require "1.43.rkt") ; repeated

; Need to test the requirements for damping
; Although there are unresolved edge cases, e.g. (to get the root of 128, 5 average damps are enough)
; it seems to be what number in a list of exponential products of 2 it is.
; I'm forgetting the mathematical term, but the authors said we can assume any mathematical operation
; is available as a primitive.
; ** Log **
; The logarithm base 2 fucntion
; The logarithm function returns how many steps it takes to get to the number n
; from base k (by default 10 -- the 'natural logarithm'). Here, it is the log
; of n base 2 that returns the required amount of 'damps' that are necessary
; for the fixed-point function to converge.
(define (nth-root x n)
    (fixed-point ((repeated average-damp (round (log n 2)))
                  (lambda (y) (/ x (expt y (- n 1)))))
                   1.0))