#lang sicp
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) nil seq))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (elm length) (+ 1 length)) 0 seq))

(define l (list 1 2 3))

(accumulate + 0 l)

(map (lambda (x) (* x x)) l)

(append l l)

(length l)