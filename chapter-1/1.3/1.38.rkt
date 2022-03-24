#lang sicp
(define (cont-frac n d k)
  (define (do-cont-frac i n d k)
    (if (> i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (do-cont-frac (+ i 1) n d k)))))
  (do-cont-frac 0 n d k))

(define (eulers x)
  (cont-frac (lambda (i) 1.0)
             (lambda (i)
               (if (= 0 (remainder i 3))
                   (* (/ i 3) 2)
                   1.0))
             x))


               