#lang sicp
(#%require "../../functions.rkt")

(define (double g)
  (display "Doubling ")(display g)(newline)
  (lambda (x) (g (g x))))