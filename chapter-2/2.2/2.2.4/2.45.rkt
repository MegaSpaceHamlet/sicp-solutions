#lang sicp
(#%require sicp-pict)
(#%require "picture-functions.rkt")

(define (split p1 p2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split p1 p2) painter (- n 1))))
          (p1 painter (p2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 4))
(paint (up-split einstein 4))