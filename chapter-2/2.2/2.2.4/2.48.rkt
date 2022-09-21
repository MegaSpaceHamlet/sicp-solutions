#lang sicp
(#%require sicp-pict)
(require "picture-functions.rkt")

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; shorthand
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)