#lang sicp
(#%require "../../functions.rkt")

(define nums (list 1 2 3 4 5))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))

(square-list nums)
(square-list-map nums)