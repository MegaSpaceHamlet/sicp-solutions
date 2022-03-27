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
               (let ((i (+ i 2)))
                 ; The math is that if for every third number, we want to get the next *even* number.
                 ; The formula starts with 1, then goes to 2 and begins the pattern.
                 ; So I just "fast-forwarded" the number by 2, to get the pattern where I want it to be.
                 ; I believe that there is a more succint, accurate formula that does not require this
                 ; work-around.
               (if (= 0 (remainder i 3))
                   (* (/ i 3.0) 2)
                   1.0)))
             x))


