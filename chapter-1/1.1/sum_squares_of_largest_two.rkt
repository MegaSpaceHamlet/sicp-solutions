#lang sicp
(define (square x) (* x x))
(define (sum_of_squares x y) (+ (square x) (square y)))  
(define (sum_squares_of_largest_two x y z)
  (cond
    ((and (> x y) (> x z))
        (if (> y z)
            (sum_of_squares x y)
            (sum_of_squares x z)))
        ((and (> y x) (> y z))
        (if (> x z)
            (sum_of_squares y x)
            (sum_of_squares y z)))
        ((and (> z x) (> z y))
             (if (> x y)
                 (sum_of_squares z x)
                 (sum_of_squares z y)))))
;;The above was my go. There is a more succint way to do it
(define (ssq_lrg2 x y z)
  (cond ((and (>= (+ x y) (+ y z)) (>= (+ x y) (+ x z))) (sum_of_squares x y)) ;;x and y are the greatest
        ((and (>= (+ x z) (+ y z)) (>= (+ x z) (+ x y))) (sum_of_squares x z)) ;;x and z are the greatest
        (else (sum_of_squares y z)) ;; y and z are the greatest
        )
  )


;; or even more succint
(define (sum_lrg2_short x y z)
  (cond ((and (<= x y) (<= x z)) (sum_of_squares y z))
        ((and (<= y x) (<= y z)) (sum_of_squares x z))
        (else (sum_of_squares x y))))

(sum_squares_of_largest_two 7 8 9)
(ssq_lrg2 7 8 9)
(sum_lrg2_short 7 8 9)
