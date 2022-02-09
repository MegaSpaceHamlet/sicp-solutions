#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (fi n)
  (if (< n 3)
      n
      (fi-iter 3 n 2 1 0)))
;;; So for the iterative version of this function, it required some forethought
;;; The main idea is that we are not asking the CPU to calculate the previous numbers over and over again.
;;; Rather, we are passing the previous total and the previous-previous total (given n >= 3)
;;; All in all, it was a great way of showing the power and intellectual challenges involving iteration over recursion
(define (fi-iter count limit total n2 n3)
  (cond ((>= count limit) (+ total (* 2 n2) (* 3 n3)))
        (else
         (fi-iter (+ count 1) limit (+ total (* 2 n2) (* 3 n3)) total n2))))

(f 15)
(fi 15)
   