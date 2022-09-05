#lang sicp
(#%require "../../../list-functions.rkt")
(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op initial (map (lambda (s) (car s)) seqs))
            (accumulate-n op initial (map (lambda (s) (cdr s)) seqs)))))

(define l (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 l)
(accumulate-n * 1 l)

      
             