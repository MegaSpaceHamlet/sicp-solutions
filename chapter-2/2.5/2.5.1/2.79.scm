#lang sicp
(define (equ? a b) (apply-generic 'equ? a b))

(define (install-scheme-number-package)
  ...
  (put 'equ? '(scheme-number scheme-number) (lambda (a b) (= a b))))

(define (install-rational-package)
  ...
  (put 'equ? '(rational rational) (lambda (a b)
                                    (and 
                                      (= (numer a) (numer b))
                                      (= (denom a) (denom b))))))

(define (install-complex-package)
  ...
  (put 'equ? '(complex complex) (lambda (a b)
                                  (and 
                                    (= (real-part a) (real-part a))
                                    (= (imag-part a) (imag-part b))))))                           
