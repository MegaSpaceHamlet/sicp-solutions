#lang sicp
(#%require sicp-pict)
;(#%require "picture-functions.rkt")

; a - outline of frame
(define outline 
  (segments->painter
   (list
    (make-segment (make-vect 0 0)
                  (make-vect 1 0))
    (make-segment (make-vect 0 0)
                  (make-vect 0 1))
    (make-segment (make-vect 0 1)
                  (make-vect 1 1))
    (make-segment (make-vect 1 1)
                  (make-vect 1 0)))))
                   
