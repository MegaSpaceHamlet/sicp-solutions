#lang sicp
(#%require "1.32-b.rkt")

(define (cont-frac n d k)
  (accumulate * 1
              (lambda (i) (+ (d i) (/ (n i) (n (+ i 1)))))
              0
              k
              inc))

(define (cf k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))