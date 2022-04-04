#lang sicp
(#%require "../../functions.rkt")
(#%require "1.3.4-newtons-method.rkt")

(define (cubic a b c)
  (lambda (x)
    (+ (cube x) (* a (square x)) (* b x) c)))

(define (zoc a b c)
  (newtons-method (cubic a b c) 1))