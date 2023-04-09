#lang sicp

(define (make-monitored f)
  (let ((counter 0))
    (define (mf input)
      (begin
        (set! counter (+ counter 1))
        (f input)))
    (define (count) counter)
    (define (reset) (begin (set! counter 0) 'ok))

    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) (count))
            ((eq? m 'reset-count) (reset))
            (else (mf m))))

    dispatch))

(define (inc n) (+ n 1))

(define monitored (make-monitored inc))

(monitored 'how-many-calls?)

(monitored 1)

(monitored 'how-many-calls?)

(monitored 'reset-count)

(monitored 'how-many-calls?)