#lang sicp
(#%provide (all-defined))
(define (factorial-rec n)
  (if (= n 1)
     1
     (* n (factorial-rec (- n 1)))))

(define (factorial-iter n)
  (fact-iter-aux 1 1 n))
  (define (fact-iter-aux product counter max-product)
    (if (> counter max-product)
        product
        (fact-iter-aux (* counter product)
                       (+ counter 1)
                       max-product)))


(factorial-rec 6)
(factorial-iter 6)