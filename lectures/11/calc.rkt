#lang sicp
(#%require "../../list-functions.rkt")
(define (calc)
  (display "calc: ")
  (write (calc-eval (read)))
  (newline)
  (calc))

(define (calc-eval exp)
  (cond ((number? exp) exp)
        ((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp))))
        (else (error "Calc: bad expression: " exp))))



(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate-list + 0 args))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                           ((= (length args) 1) (- (car args)))
                           (else (- (car args) (accumulate-list + 0 (cdr args))))))
        ((eq? fn '*) (accumulate-list * 1 args))
        ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                           ((= (length args) 1) (/ (car args)))
                           (else (/ (car args) (accumulate-list * 1 (cdr args))))))
        (else (error "Calc: bad operator: " fn))))

(calc)
