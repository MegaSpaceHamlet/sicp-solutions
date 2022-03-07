#lang sicp
(#%require "1.3.3-fixed-point.rkt")
(define (abs x)
  (if (> x 0)
      x
      (* -1 x)))

(define (close-enough? a b)
  (< (abs (- a b)) 0.0001))

(define golden-ratio 1.6180)

; The proof
(close-enough? golden-ratio (+ 1 (/ 1 golden-ratio)))

; The procedure
(define (find-phi)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

(find-phi)

             


