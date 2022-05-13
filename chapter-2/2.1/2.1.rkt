#lang sicp
(#%require "../../functions.rkt")
; Can we just talk about the name for a second?
; Rats?! Seriously?
(define (make-rat n d)
  (let ((g (gcd n d)))
    ; Exercise 2.1 Define a make-rat that handles both positive and negative numbers
    (cond ((or (and (not (neg? n)) (not (neg? d)))
               (and (neg? n) (neg? d)))
           (cons (/ (abs n) g) (/ (abs d) g)))
          ((neg? n) (cons (/ (abs n) g) (/ (* d -1) g)))
          (else (cons (/ n g) (/ d g))))))
(define (numer x)
  (car x))
(define (denom x)
  (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 3 4))
(print-rat (make-rat -3 -4))
(print-rat (make-rat -3 4))
(print-rat (make-rat 3 -4))
           