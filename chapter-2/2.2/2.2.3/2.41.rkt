#lang sicp
(#%require "../../../list-functions.rkt")
(define (sum-pairs n s)
  (map (lambda (pair)
         (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
       (filter (lambda (pair)
                 (= (+ (car pair) (cadr pair)) s))
               (unique-pairs n))))

(sum-pairs 10 13)
(sum-pairs 30 44)

