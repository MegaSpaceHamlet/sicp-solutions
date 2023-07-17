#lang sicp
(define (is-cycle? l)
  (let ((head l))
    (define (test x)
      (cond ((null? x) #f)
            ((eq? (cdr x) l) #t)
            (else (test (cdr x)))))
    (test l)))

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)


(define l (list 'a 'b 'c 'd)) 
(is-cycle? l)

(define cycle (make-cycle l))
(is-cycle? cycle)