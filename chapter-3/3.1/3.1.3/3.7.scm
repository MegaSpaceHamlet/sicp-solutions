#lang sicp
(#%require "../3.1.1/3.3.scm")

(define (make-joint-account account original-password new-password)
  (define (withdraw amount password)
    ((account original-password 'withdraw) amount))

  (define (deposit amount password)
    ((account original-password 'deposit) amount))

  (define (verify p)
    (eq? p new-password))

  (define (dispatch p m)
    (if (verify p)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Bad op -- MAKE-JOINT-ACCOUNT" m)))
        (else "Call the cops!")))
  dispatch)
    