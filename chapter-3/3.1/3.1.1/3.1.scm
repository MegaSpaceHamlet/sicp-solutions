#lang sicp

(define (make-accumulator initial)
  (let ((value initial))
    (define (add n)
      (begin
        (set! value (+ value n))
        value))
    add))

(define A (make-accumulator 5))

(A 10)

(A 10)