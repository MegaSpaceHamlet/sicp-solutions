#lang sicp
(define (cube x)
  (display "Cube of ")(display x) (display ": ")
  (display (* x x x)) (newline)
  (* x x x))

;; "Lower-Order" Procedures

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))



