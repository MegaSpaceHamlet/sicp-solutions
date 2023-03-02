#lang sicp
(define (=zero? n) (apply-generic '=zero? n))

(define (install-scheme-number-package)
  ...
  (put '=zero? '(scheme-number) (lambda (n) (= n 0))))

(define (install-rational-package)
  ...
  (put '=zero? '(rational) (lambda (n) (= (numer n) 0))))

(define (install-complex-package)
  ...
  (put '=zero? '(complex) (lambda (n) (and (= (real-part n) 0)
                                           (= (imag-part n) 0)))))
