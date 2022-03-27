#lang sicp
(define (cont-frac-var n d k)
  (define (do-cont-frac i n d k)
    (if (> i k)
        (/ (n i) (d i))
        (/ (n i) (- (d i) (do-cont-frac (+ i 2) n d k)))))
  (do-cont-frac 1.0 n d k))

(define (tan-cf x k)
  (cont-frac-var
                 (lambda (i)
                   (if (= i 1)
                                 x
                                 (square x)))
                 (lambda (i) i)
                 (* k 2)
                 ))

(define (square x) (* x x))