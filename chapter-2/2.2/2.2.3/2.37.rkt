#lang sicp
(#%require "../../../list-functions.rkt")
(define m
  (list
   (list 1 2 3 4)
   (list 4 5 6 6)
   (list 6 7 8 9)))

(define m2
  (list
   (list 3 4 5)
   (list 6 7 8)
   (list 3 2 1)
   (list 8 8 8)))

(define v (list 4 5 6))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row scalar)
         (accumulate + 0 (map (lambda (elm)
                                (* elm scalar))
                              row)))
       m
       v))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col)
                  (dot-product row col))
                cols))
         m)))
               

(eq? (+ (* 1 4) (* 2 5) (* 3 6) (* 4 6)) (dot-product (car m) (cadr m)))
(equal? (list (+ (* 1 4) (* 2 4) (* 3 4) (* 4 4))
              (+ (* 4 5) (* 5 5) (* 6 5) (* 6 5))
              (+ (* 6 6) (* 7 6) (* 8 6) (* 9 6)))
        (matrix-*-vector m v))
(equal? (transpose m) (list
                       (list 1 4 6)
                       (list 2 5 7)
                       (list 3 6 8)
                       (list 4 6 9)))
(equal? (list
         (list 56 56 56)
         (list 108 111 114)
         (list 156 161 166))
        (matrix-*-matrix m m2))