#lang sicp

(define (ripple-carry-adder a b s c)
  (if (null? a)
      (begin
        (set-signal! c 0)
        'ok)
      (let ((c-out (make-wire)))
        (full-adder (car a) (car b) c (car s) c-out)
        (ripple-carry-add (cdr a) (cdr b) (cdr s) c-out))))

; The length would the length of full-adder * n
