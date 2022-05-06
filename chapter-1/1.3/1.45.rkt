#lang sicp
(#%require "../../functions.rkt")
(#%require "1.3.3-fixed-point.rkt") ; fixed-point
(#%require "1.3.4-procedures-as-returned-values.rkt") ; average-damp
(#%require "1.43.rkt") ; repeated

(define (fourth-root x)
  (fixed-point ((repeated average-damp 2)
                (lambda (y) (/ x (expt y 3))))
                1.0))

; Need to test the requirements for damping
; Although there are unresolved edge cases, e.g. (to get the root of 128, 5 average damps are enough)
; it seems to be what number of a multiple it is of 2.
; I'm forgetting the mathematical term, but the authors said we can assume any mathematical operation
; is available as a primitive.
(define (nth-root x n)
  (let ((damp (steps-to-two n)))
    (fixed-point ((repeated average-damp damp)
                  (lambda (y) (/ x (expt y (- n 1)))))
                   1.0)))

(define (test x n damp)
  (let ((x (expt x n)))
  (fixed-point ((repeated average-damp damp)
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0)))

(define (my-test base power damp)
  (define (step i)
    (display i)
    (display ": ")
    (display (test base i damp))
    (newline)
    (step (+ i 1)))
  (step power))

(define (steps-to-two x)
    (define (step x i)
      (if (= x 2)
          i
          (step (/ x 2) (+ i 1))))
      (step x 1))
          