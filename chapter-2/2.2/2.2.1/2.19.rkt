#lang sicp
(#%require "../../list-functions.rkt")
(define us-coins (list 50 25 10 5 1))
(define coins-us (reverse us-coins))
(define alt-us-coins (list 5 25 1 50 10))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(define coins-uk (reverse uk-coins))

(define (cc amount coin-values)
  (define (first-denomination coin-values)
    (car coin-values))
  (define (except-first-denomination coin-values)
    (cdr coin-values))
  (define (no-more? coin-values)
    (null? coin-values))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

; answers are the same for lists in different order