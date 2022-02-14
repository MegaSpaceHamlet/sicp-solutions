#lang sicp
(define (identity x) x)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (add-two n) (+ n 2))


(define (accumulate combiner null-value term a b next)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) b next))))

(define (sum term a b next)
  (accumulate + 0 term a b next))

(define (product term a b next)
  (accumulate * 1 term a b next))

