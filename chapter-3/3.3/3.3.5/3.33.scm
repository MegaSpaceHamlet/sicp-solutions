#lang sicp
(#%require "propogation-of-constraints.scm")

(define (averager a b c)
  (let ((s (make-connector))
        (l (make-connector))) ; length of numbers in list (in this case 2) 
    (adder a b s)
    (constant 2 l)
    (multiplier c l s)
    'ok))

(define A (make-connector))
(define B (make-connector))
(define C (make-connector))

(averager A B C)

(probe "A" A)
(probe "B" B)
(probe "Average" C)

(set-value! A 1 'user)
(set-value! B 3 'user)

(forget-value! A 'user)
(forget-value! B 'user)

(set-value! A 10 'user)
(set-value! B 20 'user)
  
    
