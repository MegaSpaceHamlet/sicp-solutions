#lang racket
(require sicp-pict)

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

; b - "X"
(define x
  (segments->painter
   (list
    (make-segment (make-vect 0 1)
                  (make-vect 1 0))
    (make-segment (make-vect 0 0)
                  (make-vect 1 1)))))

; c - diamond
(define diamond
  (segments->painter
   (list
    (make-segment (make-vect 0.5 0)
                  (make-vect 1 0.5))
    (make-segment (make-vect 1 0.5)
                  (make-vect 0.5 1))
    (make-segment (make-vect 0.5 0)
                  (make-vect 0 0.5))
    (make-segment (make-vect 0 0.5)
                  (make-vect 0.5 1)))))

; d - wave
(define wave
  (segments->painter
   (list
    (make-segment (make-vect 0.2 0)
                  (make-vect 0.3 0.5)) ; left leg outer
    (make-segment (make-vect 0.3 0.5)
                  (make-vect 0.2 0.4)) ; left bicep lower
    (make-segment (make-vect 0.2 0.4)
                  (make-vect 0.0 0.5)) ; left forearm lower
    (make-segment (make-vect 0.25 0)
                  (make-vect 0.4 0.45)) ; left left inner
    )))

(paint wave)