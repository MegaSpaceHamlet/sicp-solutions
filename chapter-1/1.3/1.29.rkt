#lang sicp
(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (even? n) (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
  
(define (simpson f a b n)
  (define (add-y y)
    (cond ((or (= y 1) (= y n)) (f (+ a ( * y (/ (- b a) n))))); f(a + kh)
          ((and (even? a) (even? y)) (* 2 (f (+ a (* y (/ (- b a) n)))))) ; 2f(a + kh)
          ((and (even? a) (not (even? y))) (* 4 (f (+ a (* y (/ (- b a) n)))))) ;4f(a + kh)
          ((and (not (even? a)) (not (even? y))) (* 2 (f (+ a (* y (/ (- b a) n))))))
          ((and (not (even? a)) (even? y)) (* 4 (f (+ a (* y (/ (- b a) n))))))))
  (* (sum add-y 1 inc n) (/ (/ (- b a) n) 3)))
                                     

