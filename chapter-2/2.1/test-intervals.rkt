#lang sicp
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
;(define (lower-bound i) (min (car i) (cdr i)))
;(define (upper-bound i) (max (car i) (cdr i)))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define a (make-interval 3.08 3.12))
(define b (make-interval 4.12 4.76))
(define c (mul-interval a b))
(div-interval c a)