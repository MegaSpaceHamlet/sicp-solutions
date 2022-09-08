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
; From exercise 1.46
(define (iter-improve good-enough? improve)
  (define (test guess)
    (if (good-enough? guess)
        guess
        (test (improve guess))))
  (lambda (x) (test x)))

(define (to-fixed d n)
  (if (= n 0)
      (error "n must be greater than 0"))
  (let ((rounder (expt 10 n)))
    (/ (round (+ dx (* d rounder))) rounder)))

(define (fib-wrong n)
  (define (iter i prev result)
    (cond ((= n 0) 0)
          ((>= i n) result)
          (else (iter (+ i 1) result (+ prev result)))))
  (iter 0 0 1))

; the above solution is incorrect.
; the fibonacci sequence is thus: 0 1 1 2 3 5 8 13 21 ..
; the above provcedure produces this: 0 1 2 3 5 8 13 21 ..
; missing the second one.
; This is because the procedure does not fully capture the fibonacci algorithm.
; That is also why I had to add the cond, because I couldn't produce a 0 at the
; beginning.
; The below answer is very fine, and the once given in the book (Section 1.2.2 - page 50)
; https://www.lvguowei.me/post/sicp-goodness-fib/
(define (fib n)
  (define (fib-iter current next n)
    (if (= n 0)
        current
        (fib-iter next (+ current next) (- n 1))))
  (fib-iter 0 1 n))

(define (smallest-divisor n)
    (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
    (= (remainder b a) 0))
(define (exp a b)
  (cond ((= b 1) a)
        ((even? b)
         (exp (square a) (/ b 2)))
        (else (* a (exp a (- b 1))))))
(define (prime? n)
    (= n (smallest-divisor n)))