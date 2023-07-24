#lang sicp
(#%require "node.scm")
(#%require "deque-dll.scm")

(define deque (make-deque))

(front-insert-deque! deque 1)
(front-insert-deque! deque 2)
(front-insert-deque! deque 3)
(print-deque deque)

(front-delete-deque! deque)
(print-deque deque)
(front-delete-deque! deque)
(print-deque deque)
(front-delete-deque! deque)
(print-deque deque)

(define d2 (make-deque))
(rear-insert-deque! d2 1)
(rear-insert-deque! d2 2)
(rear-insert-deque! d2 3)
(print-deque d2)

(rear-delete-deque! d2)
(print-deque d2)
(rear-delete-deque! d2)
(print-deque d2)
(rear-deque d2)
(front-deque d2)
(rear-deque d2)
(rear-delete-deque! d2)
(print-deque d2)

(define d3 (make-deque))

(front-insert-deque! d3 1)
(front-insert-deque! d3 2)
(rear-insert-deque! d3 'z)
(rear-insert-deque! d3 'y)
(print-deque d3)

(front-delete-deque! d3)
(print-deque d3)

(rear-delete-deque! d3)
(print-deque d3)

(front-delete-deque! d3)
(print-deque d3)

(rear-delete-deque! d3)
(print-deque d3)

(define d4 (make-deque))

(front-insert-deque! d4 1)
(front-insert-deque! d4 2)
(rear-insert-deque! d4 'z)
(rear-insert-deque! d4 'y)
(print-deque d4)

(rear-delete-deque! d4)
(print-deque d4)

(front-delete-deque! d4)
(print-deque d4)

(rear-delete-deque! d4)
(print-deque d4)

(front-delete-deque! d4)
(print-deque d4)

(define d5 (make-deque))

(front-insert-deque! d5 1)
(front-insert-deque! d5 2)
(front-insert-deque! d5 3)
(front-insert-deque! d5 4)
(front-insert-deque! d5 5)

(front-delete-deque! d5)
(front-delete-deque! d5)
(front-delete-deque! d5)
(print-deque d5)
(rear-delete-deque! d5)
(print-deque d5)
(rear-delete-deque! d5)
(print-deque d5)