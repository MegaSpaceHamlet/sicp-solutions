#lang sicp

; The goal of this exercise is to render pascal's triangle
; everything here is iterative, because I started on an online interpreter.
; It also works better.
; TODO: The next challenge is to print it like a triangle
(define (factorial n)
  (define (step i total)
    (if (> i n)
        total
        (step (+ i 1) (* i total))))
  (step 1 1))

(define (pascal n r)
      (/ (factorial n) (* (factorial r) (factorial (- n r)))))

(define (triangle rows)
  (define (write-row n)
  (define (step i)
    (cond ((<= i n)
           (display (pascal n i))
           (display " ")
           (step (+ i 1)))
          (else (newline))))
      (step 0))
  (define (step i)
    (cond ((<= i rows)
           (write-row i)
           (step (+ i 1)))
          (else (newline))))
  (step 0))


(triangle 8)