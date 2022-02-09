#lang racket
(require racket/trace)
(define (even? n) (= (remainder n 2) 0))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (fast-multiplication a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (fast-multiplication (double a) (halve b)))
        (else (+ a (fast-multiplication a (- b 1))))))

(define (fast-multiplication-iter a b)
  (fast-multiplication-iter-aux a b 0))

(define (fast-multiplication-iter-aux a b product)
  (cond ((= b 0) product)
        ((even? b) (fast-multiplication-iter-aux (double a) (halve b) product))
        (else (fast-multiplication-iter-aux a (- b 1) (+ a product)))))



(define (stepper a b)
  (stepper-i a b 0))

(define (stepper-i a b steps)
  (display "step: ")(display steps)(newline)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (stepper-i (double a) (halve b) (+ 1 steps)))
        (else (+ a (stepper-i a (- b 1) (+ 1 steps))))))

(trace fast-multiplication)
(trace fast-multiplication-iter)
(trace fast-multiplication-iter-aux)