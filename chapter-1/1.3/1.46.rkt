#lang sicp
(#%require "../../functions.rkt")
(#%provide iter-improve)
		
(define (iter-improve good-enough? improve)
  (define (test guess)
   (if (good-enough? guess)
        guess
       (test (improve guess))))
   (lambda (x) (test x)))

; 1.1.7
(define (sqrt x)
    ((iter-improve
     (lambda (guess)
       (< (abs (- (square guess) x)) 0.001))
     (lambda (guess)
       (average guess (/ x guess))))
    1.0))

; 1.3
(define (fixed-point f)
  ((iter-improve
    (lambda (y)
      (< (abs (- y (f y))) 0.00001))
    (lambda (y)
      (f y)))
   1.0))