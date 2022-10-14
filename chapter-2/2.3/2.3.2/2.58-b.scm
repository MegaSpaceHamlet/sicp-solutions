#lang sicp
(#%require "../../../list-functions.rkt")
(#%require "selectors.scm")

(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

; this is how I wrote combine originally
;(define (combine s)
;  (let ((exp (cddr s)))
;    (cond ((null? (cdr exp)) (car exp))
;          ((sum? exp) (make-sum (addend exp) (augend exp)))
;          ((product? exp) (make-product (multiplier exp) (multiplicand exp)))
;          ((exponentiation? exp) (make-exponent (base exp) (exponent exp))))))

; I found someone who used the same idea, but saved use from all the hard work
(define (combine s)
  (if (null? (cdddr s))
      (caddr s)
      (cddr s)))
; Why write out each possibility when you can have deriv do if for you?
;
; http://community.schemewiki.org/?sicp-ex-2.58 user AA


(define (augend s) (combine s))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (product? x) (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (combine p))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (exponentiation? x) (and (pair? x) (eq? (cadr x) '**)))

(define (base exp) (car exp))

(define (exponent exp) (combine exp))

(define (make-exponent base exponent)
  (let ((exp (if (number? exponent) (- exponent 1) exponent)))
    (cond ((=number? exp 0) 0)
          ((=number? exp 1) base)
          ((and (number? base) (number? exp)) (expt base exp))
          (else (list base '** exp)))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product (exponent exp)
                        (make-exponent (base exp) (exponent exp)))
          (deriv (base exp) var)))
        (else
         (error "unkown expression type: DERIV" exp))))

(deriv '(a * (x ** 2) + b * x + c) 'x)
