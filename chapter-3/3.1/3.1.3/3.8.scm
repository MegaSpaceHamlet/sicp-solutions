#lang sicp

(define f   
  (let ((init 0)) 
    (lambda (x)  
      (set! init (- x init))  
      (- x init))))
    
(+ (f 0) (f 1))

(+ (f 1) (f 0))
