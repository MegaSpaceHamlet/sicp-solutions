#lang sicp
(#%require "../../functions.rkt")
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  ((iter-improve
    (lambda (i)
      (let ((factor (/ z (expt 2 i))))
        (or (not (even? factor)) (= factor 0))))
    inc) 0))

(define (cdr z)
  ((iter-improve
    (lambda (i)
      (let ((factor (/ z (expt 3 i))))
        (or (not (integer? (/ factor 3))) (= factor 1))))
    inc) 0))