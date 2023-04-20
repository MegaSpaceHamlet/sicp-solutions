#lang sicp
(#%require "../../../functions.rkt")

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-integral trials p x1 x2 y1 y2)
  (* (monte-carlo trials (lambda () (p x1 x2 y1 y2 1))) 4))

(define (p x1 x2 y1 y2 r)
  (<= (+ (square (random-in-range x1 x2))
         (square (random-in-range y1 y2)))
      r))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(exact->inexact (estimate-integral 100000 p -1.0 1.0 -1.0 1.0))