#lang sicp
(#%require "propogation-of-constraints.scm")
(#%require "3.37.scm")

; given the answer on http://community.schemewiki.org/?sicp-ex-3.37, this test is irrelevant

(define divisor (make-connector))
(define dividend (make-connector))
(define quotient (c/ divisor dividend))

(probe "Divisor" divisor)
(probe "Dividend" dividend)
(probe "Quotient" quotient)

(set-value! divisor 20 'user)
(set-value! dividend 10 'user)
(forget-value! divisor 'user)
(forget-value! dividend 'user)

(set-value! divisor 10 'user)
(set-value! quotient 5 'user)
(forget-value! divisor 'user)
(forget-value! quotient 'user)

(set-value! dividend 3 'user)
(set-value! quotient 7 'user)