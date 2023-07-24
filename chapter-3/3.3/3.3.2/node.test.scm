#lang sicp
(#%require "node.scm")
(define n (make-node '() 1 '()))

(prev n)
(val n)
(next n)

(define l1 (list 0 1))
(define l2 (list 3 4))

(define n1 (make-node l1 2 l2))

(prev n1)
(val n1)
(next n1)

(define n2 (make-node n 2 n1))

(prev n2)
(val n2)
(next n2)

(define l (list 1 2 3 n2))

(set-prev! n2 l)

(prev n2)