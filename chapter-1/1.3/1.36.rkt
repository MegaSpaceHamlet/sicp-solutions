#lang sicp
(define (abs x)
  (if (< x 0)
      (* x -1)
      x))

(define (average a b) (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display count) (display ": ") (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ 1 count)))))
  (try first-guess 0))

; Without average-damping
(define (x^x x)
  (fixed-point (lambda (y) (/ (log 1000) (log y)))
               x))

; With average-damping
(define (avg-x^x x)
  (fixed-point (lambda (y) (average y (/ (log 1000) (log y))))
               x))

; In my tests, 20+ more steps without average damping
