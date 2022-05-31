#lang sicp
(#%require "../../functions.rkt")
(#%require (file "..\\..\\chapter-1\\1.3\\1.46.rkt")) ; Iter-Improve
(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define pair (cons 2 3))

(define (car z)
  (let ((base 2)
        (other-base 3))
  ((iter-improve
   (lambda (i)
     (let ((p (log (/ z (expt base i)) other-base))) 
     ; Is p an int?
     (cond ((= (abs (/ p (round p))) 0)
            (if (= (* (expt other-base p) (expt base i)) z)
                i
                #f))
           (else #f))))
   inc) 0.0)))
   
           
         