#lang sicp
(#%require "2.1.4-extended-exercise.rkt")

;; The minimum value would be the smallest possible value 
;; of the first minus the largest of the second.  The maximum would be 
;; the largest of the first minus the smallest of the second.
;; (Above is taken from community.schemewiki.org?sicp-ex-2.8
;; I did not think to give this answer.
;; Originally, I put upper-bound x - upper-bound y
;;                   lower-bound x - lower-bound y
;; But the above produces correct answers. Have to
;; think abount it
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define a (make-interval 3.08 3.12))
(define b (make-interval 4.3 4.78))
;(define ab (add-interval a b))
;(define c (sub-interval ab a))
(define d (mul-interval a b))
(define e (div-interval d b))
;(display "a ")(print-interval a)
;(newline)
;(display "b ")(print-interval b)
;(newline)
;(display "a + b ")(print-interval ab)
;(newline)
;(display "(a + b) - a ")(print-interval c)
;(newline)
(display "a * b ")(print-interval d)
(newline)
(display "(a * b) / b ")(print-interval e)
(newline)
(define i1 (make-interval 4 5))
(define i2 (make-interval 1 2))
(define i3 (sub-interval i1 i2))
(display "i1 - i2 = ")(print-interval i3)(newline)