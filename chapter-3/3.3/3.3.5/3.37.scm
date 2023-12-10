#lang sicp
(#%require "propogation-of-constraints.scm")
(#%provide (all-defined))

(define (c+ x y)
  (let ((z (make-connector)))
    (adder x y z)
    z))

(define (c* x y)
  (let ((z (make-connector)))
    (multiplier x y z)
    z))

; the real answer is
; (adder z y x)
; i.e. 3 - 2 = difference is the same as difference + 2 = 3
(define (c- x y)
  (let ((z (make-connector)))
    (subtracter x y z)
    z))

; the real answer is
; (multiplier z y x)
; i.e. 15 / 5 = quotient is the same as quotient * 5 = 15
(define (c/ x y)
  (let ((z (make-connector)))
    (divider x y z)
    z))

(define (cv value)
  (let ((z (make-connector)))
    (constant value z)
    z))

; all the below was made before finding out the clever answer on the wiki page
; http://community.schemewiki.org/?sicp-ex-3.37
(define (subtracter m s difference)
  (define (process-new-value)
    (cond ((and (has-value? m) (has-value? s))
           (set-value! difference (- (get-value m) (get-value s)) me))
          ((and (has-value? m) (has-value? difference))
           (set-value! difference (- (get-value m) (get-value difference)) me))
          ((and (has-value? s) (has-value? difference))
           (set-value! m (+ (get-value s) (get-value difference)) me))))
  (define (process-forget-value)
    (forget-value! m me)
    (forget-value! s me)
    (forget-value! difference me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value) (process-new-value))
          ((eq? request 'I-lost-my-value) (process-forget-value))
          (else (error "Unkown request: SUBTRACTER" request))))
  (connect m me)
  (connect s me)
  (connect difference me)
  me)

(define (divider divisor dividend quotient)
  (define (process-new-value)
    (cond ((and (has-value? divisor) (has-value? dividend))
           (set-value! quotient (/ (get-value divisor) (get-value dividend)) me))
          ((and (has-value? divisor) (has-value? quotient))
           (set-value! dividend (/ (get-value divisor) (gcd (get-value divisor) (get-value quotient))) me))
          ((and (has-value? dividend) (has-value? quotient))
           (set-value! divisor (* (get-value dividend) (get-value quotient)) me))))
  (define (process-forget-value)
    (forget-value! divisor me)
    (forget-value! dividend me)
    (forget-value! quotient me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value) (process-new-value))
          ((eq? request 'I-lost-my-value) (process-forget-value))
          (else (error "Unkown request: DIVIDER" request))))
  (connect divisor me)
  (connect dividend me)
  (connect quotient me)
  me)
