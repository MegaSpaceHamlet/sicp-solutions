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