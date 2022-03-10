#lang sicp
(define (cont-frac n d k)
  (define (do-cont-frac i n d k total)
    (if (> i k)
        total
        (do-cont-frac (+ i 1) n d k (/ total (/ (n i) (d i))))))
  (let ((i 0))
    (do-cont-frac i n d k (/ (n i) (d i)))))

(define (cf x)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             x))
