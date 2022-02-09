#lang racket
(require racket/trace)
(require "functions.rkt")

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib-log n)
  (fib-iter-log 1 0 0 1 n))

(define (fib-iter-log a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter-log a
                       b
                       (+ (* p p) (* q q)) ; Several way to understand this.
                                           ; Tpq(a,b)(Tpq(a,b)) -- expand that, then refactor
                       (+ (* 2 p q) (* q q)) ; Or look at the Fibonacci matrix
                                             ; though I will admit, that I did not fully grasp either
                       (/ count 2)))
        (else (fib-iter-log (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))))


(trace fib)
(trace fib-iter)
(trace fib-log)
(trace fib-iter-log)