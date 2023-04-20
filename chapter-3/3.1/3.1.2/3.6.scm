#lang sicp
(define rand
  (let ((x 0))
    (define (generate)
      (begin
        (set! x (rand-update x))
        x))

    (define (reset val)
      (begin
        (set! x val)
        x))

    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (else (error "Bad op -- RAND" m))))

    dispatch))

(define (rand-update x)
  (modulo (+ (* 77 x) 11) 4))

(rand 'generate)
(rand 'generate)
((rand 'reset) 0)
(rand 'generate)
(rand 'generate)