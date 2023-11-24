#lang sicp
(#%require "propogation-of-constraints.scm")

(define C (make-connector))
(define F (make-connector))

(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)

(define (celsius-fahrenheit-converter c f)
  (let ((u (make-connector))
        (v (make-connector))
        (w (make-connector))
        (x (make-connector))
        (y (make-connector)))
    (multiplier c w u)
    (multiplier v x u)
    (adder v y f)
    (constant 9 w)
    (constant 5 x)
    (constant 32 y)
    'ok))

(celsius-fahrenheit-converter C F)

(set-value! C 25 'user) ; F = 77
; (set-value! F 212 'user) ; error!
(forget-value! C 'user)
(set-value! F 212 'user) ; C = 100