#lang sicp
(define (smallest-divisor n)
    (find-divisor n 2))
(define (next n) (if (= n 2) 3 (+ n 2)))
(define (find-divisor n test-divisor)
    (cond((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
    (= (remainder b a) 0))
(define (square x) (* x x))
(define (even? n) (= (remainder n 2) 0))
(define (exp a b)
  (cond ((= b 1) a)
        ((even? b)
         (exp (square a) (/ b 2)))
        (else (* a (exp a (- b 1))))))
(define (prime? n)
    (= n (smallest-divisor n)))


;; timed-test-prime
(define (ttt n)
    (newline)
    (display "Starting with ") (display n) (newline)
    (search-for-primes n 0 (runtime)))
(define (search-for-primes n count start-time)
    (cond ((= count 3) (report-prime (- (runtime) start-time)))
           ((even? n) (search-for-primes (+ n 1) count start-time))
           ((prime? n)
            (display n) (display " is prime") (newline)
            (search-for-primes (+ n 2) (+ count 1) start-time))
           (else (search-for-primes (+ n 2) count start-time))))
(define (report-prime elapsed-time)
    (display "time elapsed --- ")
    (display elapsed-time) (display " in milliseconds") (newline)
    (display (get-seconds elapsed-time)) (display " in seconds"))
(define (get-seconds microseconds)
  (round (/ microseconds 1000000)))

; tests
; This one grows more like a 1.5 ratio
; The reason is because we still have to do the if clause
; (ttt (exp 10 15)) -- ~2 seconds
; (ttt (exp 10 16)) -- ~7 seconds
; (ttt (exp 10 17)) -- ~21 seconds

