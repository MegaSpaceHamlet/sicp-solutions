#lang sicp
(define (identity x) x)

(define (inc n) (+ n 1))

(define (add-two n) (+ n 2))

(define pi 3.14159)

(define (product term a b next)
  (if (> a b)
     1
     (* (term a) (product term (next a) b next))))

(define (factorial n)
  (product identity 1 n inc))


; The Wallis Product is (2k)(2k)
;                       -------
;                       (2k-1)(2k+1)
; Starting from (2
;                -
;                2)
;
; That formula will result in approximately (/ pi 2)
; However, the book is asking for (/ pi 4)
; Additionally, the book's formula begins with (2 over 3)
;
; Doing the regular formula results in (/ pi 2)
; 
; Upon closer observation, I relaized that to start with (2 over 2)
; multiplies the desired product by 2, hence returning (/ pi 2), not (/ pi 4)
; So I had to cancel out the original (2 over 1) multiplication. But how?
; If I'm starting from 2, (2 - 1) = 1!
;
; Thus I realized the formula of the book is basing off of the denominator, not
; the numerator.
; By starting with 3 as k, and multiply (3     3
;                                        -  *  -
;                                      3-1     3+1)
; I was able to avoid the multiplication by 2, and reach the desired result.

(define (wallis n)
  (define (wallis-next k)
    (* (/ (- k 1) k)
       (/ (+ k 1) k)))
  (product wallis-next 3.0 n add-two))