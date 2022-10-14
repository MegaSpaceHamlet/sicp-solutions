#lang sicp
(#%require "../../../list-functions.rkt")
(#%require "selectors.scm")

(define (augend s)
  (accumulate make-sum 0 (cddr s)))

(define (multiplicand p)
  (accumulate make-product 1 (cddr p)))

; have to define deriv after new def for augend/multiplicand

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unkown expression type: DERIV" exp))))
          

(deriv '(+ x y x 3) 'x)
(deriv '(+ x y (* x y) 3) 'x)

(deriv '(* x y (+ x 3)) 'x)
(deriv '(* x (* y 2) 3 4 5) 'x)
