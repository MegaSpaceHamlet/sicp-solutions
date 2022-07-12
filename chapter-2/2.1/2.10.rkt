#lang sicp
(#%require "2.1.4-extended-exercise.rkt")

(define spans-zero (make-interval -1 1))
(define includes-zero (make-interval 0 4))
; The problem is "includes-zero" because that is where
; the function will try to divide by 0.
; However, in truth, the promblem is also "spans-zero"
; as stated in the book. 
; Solution
(define (div-interval-enhanced x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Division error (interval spans 0)"(print-interval y)))
  (div-interval x y))

; My original solution, which did not account for intervals spanning zero
(define (div-interval-enhncd x y)
  (if (or (= (lower-bound y) 0) (= (upper-bound y) 0))
      (error "Cannot divide by zero"))
  (div-interval x y))