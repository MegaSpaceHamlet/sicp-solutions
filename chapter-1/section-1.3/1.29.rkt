#lang sicp
(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (even? n) (= (remainder n 2) 0))

;; Higher-Order
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; Using the higher-order 'sum' procedure
(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;(define (simpson f a b n)
;  (define h
;    (/ (- b a) n))
;  (define (add-y y)
;    (define (simp-y y)
;      (+ a (* y h)))
;    (cond ((or (= y 0) (= y n)) simp-y y)
;          ((even? y) (* 2.0 (simp-y y)))
;          (else (* 4.0 (simp-y y)))))
;  (* (/ h 3.0)
;     (sum f (+ a (* 1 h)) add-y n)))
  
(define (simpson f a b n)
  (define (add-y y)
    (cond ((or (= y 1) (= y n)) (f (+ a ( * y (/ (- b a) n))))); f(a + kh)
          ((and (even? a) (even? y)) (* 2 (f (+ a (* y (/ (- b a) n)))))) ; 2f(a + kh)
          ((and (even? a) (not (even? y))) (* 4 (f (+ a (* y (/ (- b a) n)))))) ;4f(a + kh)
          ((and (not (even? a)) (not (even? y))) (* 2 (f (+ a (* y (/ (- b a) n))))))
          ((and (not (even? a)) (even? y)) (* 4 (f (+ a (* y (/ (- b a) n))))))))
  (* (sum add-y 1 inc n) (/ (- b a) n)))
                                     

