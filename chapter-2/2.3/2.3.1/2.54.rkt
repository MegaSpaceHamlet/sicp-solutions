#lang sicp
(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (symbol? a) (symbol? b)) (eq? a b))
        ((and (number? a) (number? b)) (= a b))
        ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        (else #f)))

(equal? 'a 'a)
(equal? 'a 'b)
(newline)

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(newline)

(equal? 5 5)
(equal? 5 4)
(newline)

(equal? '(this list has 4 words) '(this list has 5 words))
(equal? '(list 4 5) '(list 5 6))
(newline)

(equal? '(5 6 7) '(5 6 7))
                                  