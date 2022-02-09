#lang racket
(#%require (lib "27.ss" "srfi"))
(require racket/trace)

(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

(define (try-it a n)
  (do-it (expmod a (- n 1) n) (remainder 1 n)))

(define (do-it a n)
    (= a n))

(define (miller-rabin-test n)
  (try-it (+ 1 (random-integer (- n 1))) n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
        (remainder (square (nontrivial? (expmod base (/ exp 2) m) m)) m))
  (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (nontrivial? a n)
  (cond ((or (= a 1) (= a (- n 1))) a)
      ((= (remainder (square a) n) (remainder 1 n)) 0)
      (else a)))

(define (mr-fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (mr-fast-prime? n (- times 1)))
        (else false)))

(define (start n)
  (mr-fast-prime? n (floor (/ n 2))))

(define (loop n)
  (loop-i 3 n))

(define (loop-i index max)
  (cond ((= index max) false)
        ((start index) (display index) true)
        (else (loop-i (+ 1 index) max))))

(trace try-it)
(trace nontrivial?)
;(trace miller-rabin)
(trace expmod)
;(trace square)
;(trace do-it)
;(mr-fast-prime? 561 7)
;(mr-fast-prime? 560 7)
;(start 8)
