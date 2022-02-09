#lang sicp
(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

(define (exp b n)
  (exp-iter b n 1 0))

; The final call of the procedure (where count == 0) is not another exponential multiplication
; It merely returns the number * 1, basically returning the number itself.
(define (exp-iter base count prod steps)
  (cond ((= count 0)
         (display "steps: ")(display (- steps 1))(newline)
         prod)
        ((even? count) (exp-iter (square base) (/ count 2) prod (+ 1 steps)))
        (else (* base (exp-iter base (- count 1) prod (+ 1 steps))))))

(exp 3 2)
(exp 2 3)
(exp 2 4)
(exp 2 8)
(exp 2 16)
(exp 3 32)
(exp 2 1000)
