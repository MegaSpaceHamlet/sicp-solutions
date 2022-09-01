#lang sicp
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))


(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (* (+ this-coeff (* higher-terms x))))
              0
              coefficient-sequence))

(define answer (horner-eval 2 (list 1 3 0 5 0 1)))
(if (eq? answer 79)
    #t
    answer)