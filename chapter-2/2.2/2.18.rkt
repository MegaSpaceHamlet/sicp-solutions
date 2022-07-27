#lang sicp
(define (reverse items)
  (if (null? (cdr items))
      (car items)
      (cons (reverse (cdr items)) (car items))))
(define nums (list 1 2 3 4 5))
(reverse nums)