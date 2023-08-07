#lang sicp
(#%require "3.24.scm")

(define t (make-table equal?))
(define get (t 'lookup-proc))
(define put (t 'insert-proc!))

(put 'a 1)
(put 'b 2)
(put 'c 3)

(eq? (get 'a) 1)
(eq? (get 'b) 2)
(eq? (get 'c) 3)

(put 'b 'b)
(eq? (get 'b) 'b)

(define t1 (make-table (lambda (a b) (= (floor a) (floor b)))))
(define get1 (t1 'lookup-proc))
(define put1 (t1 'insert-proc!))

(put1 3 'a)
(put1 3.2 'b)
(eq? (get1 3) 'b)