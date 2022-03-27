#lang sicp
(define (cont-frac-hi start combiner n d k step)
  (define (do-cont-frac i n d k)
    (if (> i k)
      (/ (n i) (d i))
      (/ (n i) (combiner (d i) (do-cont-frac (step i) n d k)))))
  (do-cont-frac start n d k))

(define (phi limit)
  (cont-frac-hi
   0
   +
   (lambda (i) 1.0)
   (lambda (i) 1.0)
   limit
   inc))

(define (eulers limit)
  (cont-frac-hi
   2
   +
   (lambda (i) 1.0)
   (lambda (i)
     (if (= (remainder i 3) 0)
         (* (/ i 3) 2)
         1.0))
   limit
   inc))

(define (tan-cf radian limit)
  (let ((start 1.0))
  (cont-frac-hi
   start
   -
   (lambda (i) (if (= i start)
                   radian
                   (square radian)))
   (lambda (i) i)
   (* limit 2)
   (lambda (i) (+ i 2)))))
     
(define (inc i) (+ i 1))
(define (square x) (* x x))
         