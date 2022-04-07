#lang sicp
(#%require "../../functions.rkt")
(#%provide compose)
(define (compose f g)
  (lambda (x) (f (g x))))
