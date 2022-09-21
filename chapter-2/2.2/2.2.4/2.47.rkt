#lang sicp
(#%require "2.46.rkt")
; first implementation
(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin1 f)
  (car f))

(define (edge1-1 f)
  (cadr f))

(define (edge2-1 f)
  (caddr f))

; second implementation
(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin2 f)
  (car f))

(define (edge1-2 f)
  (cadr f))

(define (edge2-2 f)
  (cddr f))

(define f1 (make-frame1 (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(origin1 f1)
(edge1-1 f1)
(edge2-1 f1)

(define f2 (make-frame2 (make-vect 0 0) (make-vect 1 0) (make-vect 0 1)))
(origin2 f2)
(edge1-2 f2)
(edge2-2 f2)