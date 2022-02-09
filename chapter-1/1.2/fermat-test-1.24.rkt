#lang sicp
(#%require (lib "27.ss" "srfi"))

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
  (cond ((= b 0) 1)
        ((even? b)
         (exp (square a) (/ b 2)))
        (else (* a (exp a (- b 1))))))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

;; timed-test-prime
(define (ttt n)
    (newline)
    (display "Starting with ") (display n) (newline)
    (search-for-primes n 0 (runtime)))

(define (search-for-primes n count start-time)
    (cond ((= count 3) (report-prime (- (runtime) start-time)))
           ((even? n) (search-for-primes (+ n 1) count start-time))
           ((fast-prime? n 100)
            (display n) (display " is prime") (newline)
            (search-for-primes (+ n 2) (+ count 1) start-time))
           (else (search-for-primes (+ n 2) count start-time))))

(define (report-prime elapsed-time)
    (display "time elapsed --- ")
    (display elapsed-time) (display " in microseconds") (newline)
    (display (get-seconds elapsed-time)) (display " in seconds"))

(define (get-seconds microseconds)
  (round (/ microseconds 1000000)))