#lang sicp
(#%require "../../functions.rkt")

(define (double g)
  (lambda (x) (g (g x))))