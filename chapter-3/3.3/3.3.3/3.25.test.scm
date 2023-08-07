#lang sicp
; test multi-dimensional tables
(#%require "3.25.scm")

(define 1d-table (make-table))

(insert! '(a) 1 1d-table)
(eq? (lookup '(a) 1d-table) 1)

(insert! '(a) 2 1d-table)
(eq? (lookup '(a) 1d-table) 2)

(define 2d-table (make-table))

(insert! '(a b) 1 2d-table)
(eq? (lookup '(a b) 2d-table) 1)

(insert! '(b c) 2 2d-table)
(eq? (lookup '(b c) 2d-table) 2)

(define 3d-table (make-table))

(insert! '(a b c d) 1 3d-table)
(eq? (lookup '(a b c d) 3d-table) 1)

;; Only caveat is that you can't replace a primitive value with a table

;(insert! '(a b) 3 1d-table)
;(eq? (lookup '(a b) t) 3)

;(insert! '(a b c d e f g) 4 t)
;(eq? (lookup '(a b c d e f g) t) 4)