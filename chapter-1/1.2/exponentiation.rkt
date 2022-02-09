#lang sicp
(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-i b n)
  (fast-expt-iter b n 1 0))

; This is the scratchpad for exercise 1.16 in SICP. The goal is to write an iterative
; procedure that will exponentiate in logarithmic time.
; I originally wrote the procedure in a way that the counter was subtracted by 2 each time,
; but then I saw that other answers (which followed the hint in the book) divided the counter
; by 2. Essentially, (b^n/2)^2 = (b^2)^n/2  which means halve n and square b.
; The only thing I was hung up about was how did the procedure return the correct value
; if it was always returning product? In an even case.
; Then I saw that the even procedure halves itself, so it will always end up at 1,
; which is an odd count, and will return b * 1. And b has been squaring itself
; all along.
; The final procedure will be written in another file called 'expt-final.rkt'.

(define (fast-expt-iter b counter product steps)
  (cond ((= counter 0) (display "steps: ")(display steps)(newline)
                       (display "product: ") product)
        ((even? counter) (display "E:")(fast-expt-iter b (- counter 2) (* product (square b)) (+ 1 steps)))
        (else (display "O:") (* b (fast-expt-iter b (- counter 1) product (+ 1 steps))))))


(define (fast-exp-i b n)
  (fast-exp-iter b n 1 0))

(define (fast-exp-iter b counter product steps)
  (cond ((= counter 0)
         (newline)
         (display "b: ")(display b)(display " counter: ")(display counter)
         (display " steps: ")(display steps)(newline)
         (display "product: ") product)
        ((even? counter) (display "E:")
                         ;(display "b: ")(display b)(display " n: ")(display counter)(display " product: ")(display product)
                         (fast-exp-iter (square b) (/ counter 2) product (+ 1 steps)))
        (else (display "O:")
              ;(display "b: ")(display b)(display " n: ")(display counter)(display " product: ")(display product)(display " ")
              (* b (fast-exp-iter b (- counter 1) product (+ 1 steps))))))

(display "Mynus way:") (newline)
(display "----------") (newline)
(fast-expt-i 2 16)
(fast-expt-i 2 32)



(display "Divisive way: ") (newline)
(display "----------") (newline)
(fast-exp-i 2 16)
(fast-exp-i 2 32)
(fast-exp-i 2 1)
(fast-exp-i 2 1000)
