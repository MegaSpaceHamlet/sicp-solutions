#lang sicp
(define (identity x) x)

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (add-two n) (+ n 2))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b) (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (filter-prime n default)
  (cond ((prime? n) (display n) (display " is prime")(newline) n)
        (else default)))

(define (filtered-accumulate combiner null-value filter term a b next)
  (if (> a b)
      null-value
      (combiner (term (filter a null-value)) (filtered-accumulate combiner null-value filter term (next a) b next))))

(define (accept n defualt) n)

(define (sum term a b next)
  (filtered-accumulate + 0 accept term a b next))

(define (product term a b next)
  (filtered-accumulate * 1 accept term a b next))

(define (sum-square-of-primes a b)
  (filtered-accumulate + 0 filter-prime square a b inc))

;; This way does not require modification of the filter procedure
(define (other-filtered-accumulate combiner null-value filter term a b next)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (other-filtered-accumulate combiner null-value filter term (next a) b next)))
        (else (combiner null-value (other-filtered-accumulate combiner null-value filter term (next a) b next)))))

(define (other-sum-of-squares a b)
  (other-filtered-accumulate + 0 prime? square a b inc))


(define (product-of-relative-primes n)
  (define (relatively-prime? i)
    (cond ((= (gcd i n) 1) (display i) (display " is relatively prime")(newline) true)
          (else false)))
  (other-filtered-accumulate * 1 relatively-prime? identity 0 n inc))


