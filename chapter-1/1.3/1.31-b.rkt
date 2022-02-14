#lang sicp
(define (identity x) x)

(define (inc n) (+ n 1))

(define (add-two n) (+ n 2))

(define pi 3.14159)

(define (product term a b next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 n inc))

(define (wallis n)
  (define (wallis-next k)
    (* (/ (- k 1) k)
       (/ (+ k 1) k)))
  (product wallis-next 3.0 n add-two))