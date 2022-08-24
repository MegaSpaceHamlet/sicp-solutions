#lang sicp
(#%require "../../list-functions.rkt")
(define nums (list 1 2 3 4 5))

; I was thinking about this answer, but did not implement it before
; I checked.
; my original function was this
; (define (reverse items)
;   (if (null? (cdr items))
;       (car items)
;       (cons (reverse (cdr items)) (car items))))
; Which produced this:
; (((((5 . 4) . 3) . 2) . 1)
(define (mistaken-reverse items)
  (if (null? (cdr items))
      (car items)
      (cons (mistaken-reverse (cdr items)) (car items))))
(mistaken-reverse nums)

; Correct implementation of the above
; recursive procedure
(define (reverse items)
  (if (null? (cdr items))
      items
      (append (reverse (cdr items)) (list (car items)))))

(reverse nums)

; Another Correct answer that I got on my own
; the iterative solution
(define (reverse-b items)
  (define (reverse-aux a b)
    (if (null? a)
        b
        (reverse-aux (cdr a) (cons (car a) b))))
  (reverse-aux items nil))
(reverse-b nums)