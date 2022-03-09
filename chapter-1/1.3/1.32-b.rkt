#lang sicp
(#%provide accumulate inc)
(define (identity x) x)

(define (inc n) (+ n 1))

(define (cube x) (* x x x))

(define (add-two n) (+ n 2))


(define (accumulate combiner null-value term a b next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a b next)
  (accumulate + 0 term a b next))

(define (product term a b next)
  (accumulate * 1 term a b next))

