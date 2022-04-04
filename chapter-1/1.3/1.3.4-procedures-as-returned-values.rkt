#lang sicp
(#%require "1.3.3-fixed-point.rkt")

(define (square x) (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (avg-sqr x)
  ((average-damp square) x))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(#%provide average-damp)