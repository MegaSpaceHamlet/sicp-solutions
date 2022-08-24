#lang sicp
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
(define squares (list 1 4 9 16 25))
(last-pair squares)
             