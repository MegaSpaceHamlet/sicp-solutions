#lang sicp
(define x (cons 'a 'b))
(define z (cons 'c 'd))
(define l (list x x z z))

(define (count-pairs x)
  (let ((counted-pairs (list)))
    (define (count-pair p)
      (cond ((not (pair? p)) 0)
            ((memq p counted-pairs) 0)
            (else
             (begin
               (set! counted-pairs (cons p counted-pairs))
               (+ (count-pair (car p))
                  (count-pair (cdr p))
                  1)))))
    (count-pair x)))
          

(count-pairs l)
