#lang sicp
(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define c-0 ((zero (lambda (x) x)) 0))
(define c-1 ((one inc) 0))