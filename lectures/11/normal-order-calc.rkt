#lang sicp
; this is an incomplete program. it is an attempt to implement
; normal-order evaluation on the example calculator of Lecture 11.
; I don't know or understand enough at thi time
(#%require "../../list-functions.rkt")
(define (calc)
  (display "calc: ")
  (write (calc-eval (read)))
  (newline)
  (calc))


(define (calc-eval exp)
  (cond ((number? exp) exp)
        ((list? exp) (cond ((fn? (car args)) 
                            (calc-apply (car exp) (calc-eval (cdr exp))))
                           
        (else (error "Calc: bad expression: " exp))))

(define (calc-apply fn args)
  (cond 
        ((eq? fn '+) (+ (car args) (calc-apply (cdr args))))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                           ((= (length args) 1) (- (car args)))
                           (else (- (car args) (accumulate-list + 0 (cdr args))))))
        ((eq? fn '*) (accumulate-list * 1 args))
        ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                           ((= (length args) 1) (/ (car args)))
                           (else (/ (car args) (accumulate-list * 1 (cdr args))))))
        (else (error "Calc: bad operator: " fn))))

(calc)