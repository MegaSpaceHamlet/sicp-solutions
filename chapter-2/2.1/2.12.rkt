#lang sicp
(#%require "2.1.4-extended-exercise.rkt")
(#%provide (all-defined))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c (/ p 100))))
    (make-interval (- c w) (+ c w))))

(define (percent i)
  (let ((c (center i)))
    (let ((diff (- (upper-bound i) c)))
    (* (/ diff c) 100))))

(define i (make-center-width 3.5 0.15))
(define ip (make-center-percent 3.5 (percent i)))