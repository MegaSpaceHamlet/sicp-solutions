#lang sicp
(#%require "../../functions.rkt")
(define nums (list 1 2 3 4 5))

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
(square-list1 nums)
; Louis' first way of doing it produces the desired
; list in reverse order because he is cons-ing the
; new item squared on to the previous item squared
; and so on.
; 
; 1st round:
; (cons (sqr 1) nil)
; (cons (sqr 2) (1))
; (cons (sqr 3) (4 1))
; and so on
;
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list nums)
; The second example is faulty because each iteration
; cons-es a cons and a value, which will not produce
; a list. To produce a list, you need to cons a value
; as the first arguement and a cons as the second.
; Watch what happens here:
; (cons nil 1)
; (cons (cons nil 1) 2)
; (cons (cons (cons nil 1) 2) 3)
; See? 