#lang sicp
(#%require "../../list-functions.rkt")
(define (same-parity a . w)
  (define (step items result test)
    (if (null? items)
        result
        (step (cdr items)
              (if (test (car items))
                  (append result (cons (car items) nil))
                  result)
              test)))
  (step w (list a) (if (odd? a)
                       odd?
                       even?)))

; An interesting example that I thought of, but did
; not write at first, I found on community.schemewiki.org.
; The user mueen claims that the above method, which uses
; append on every successful test, is expensive, so they
; reverse the resulting list at the end instead.
; This is helpful only if the reverse procedure is using
; an iterative process, thus making this the iterative
; procedure, and the above function, the recursive one.s
(define (same-parity-with-reverse a . w)
  (let ((test (if (odd? a) odd? even?)))
    (define (step items result)
      (if (null? items)
          (reverse result)
          (step
           (cdr items)
           (if (test (car items))
               (cons (car items) result)
               result))))
    (step w (list a))))

(same-parity 1 2 3 4 5 6 7 8 9 10)
(same-parity-with-reverse 1 2 3 4 5 6 7 8 9 10)
(same-parity 2 3 4 5 6 7 8 9 10 11 12)
(same-parity-with-reverse 2 3 4 5 6 7 8 9 10 11 12)