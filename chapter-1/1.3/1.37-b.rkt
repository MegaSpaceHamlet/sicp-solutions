#lang sicp
; cont-frac iterative
; The trick here is to work backwards.
; It's a succession of fractions that
; are all the denominator of the ele-
; ment above it.
; Start off with the k-th term, then
; place that "under" the next term
; (with the necessary additions)
; and voila!
; There you have it. 
(define (cont-frac n d k)
  (define (do-cont-frac i n d k total)
    (display total) (newline)
    (if (<= i 1)
        (/ (n i) (+ (d i) total))
        (do-cont-frac (- i 1) n d k (/ (n i) (+ (d i) total)))))
  (let ((i k))
    (do-cont-frac i n d k (/ (n i) (d i)))))


(define (cf x)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             x))
