#lang sicp
(#%provide (all-defined))

(define dx 0.00001)

(define (neg? x)
  (< x 0))
(define (inc x)
  (+ x 1))
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
(define (average x y)
  (/ (+ x y) 2))
(define (fact-iter n)
  (define (step i total)
    (if (> i n)
        total
        (step (+ i 1) (* i total))))
  (step 1 1))
(define (fact-rec n)
  (if (<= n 1)
      1
      (* n (fact-rec (- n 1)))))

