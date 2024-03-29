#lang sicp
(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) r)
          ((eq? op 'angle) a)
          ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          (else (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))
(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))

;;; test
(define z (make-from-mag-ang 4 6))
(magnitude z) ; 4
(angle z) ; 6
(real-part z) ; 3.84
(imag-part z) ; -1.1
