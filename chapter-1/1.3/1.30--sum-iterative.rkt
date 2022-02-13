#lang sicp
(define (inc n) (+ n 1))

(define (identity x) x)

(define (sum term a b next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
    