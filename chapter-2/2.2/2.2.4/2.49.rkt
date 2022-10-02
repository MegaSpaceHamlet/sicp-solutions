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
                  (make-vect 0.4 0.5)) ; left leg outer
    (make-segment (make-vect 0.4 0.5)
                  (make-vect 0.2 0.4)) ; left bicep lower
    (make-segment (make-vect 0.2 0.4)
                  (make-vect 0.0 0.5)) ; left forearm lower
    (make-segment (make-vect 0.3 0)
                  (make-vect 0.5 0.3)) ; left leg inner
    (make-segment (make-vect 0.5 0.3)
                  (make-vect 0.7 0)) ; right leg inner
    (make-segment (make-vect 0.8 0)
                  (make-vect 0.6 0.5)) ; right leg outer
    (make-segment (make-vect 0.6 0.5)
                  (make-vect 0.7 0.5)) ;right bicep lower
    (make-segment (make-vect 0.7 0.5)
                  (make-vect 1.0 0.3)) ; right forearm lower
    (make-segment (make-vect 1.0 0.4)
                  (make-vect 0.7 0.6)) ; right forearm upper
    (make-segment (make-vect 0.7 0.6)
                  (make-vect 0.6 0.6)) ; right shoulder
    (make-segment (make-vect 0.6 0.6)
                  (make-vect 0.6 0.7)) ; right neck
    (make-segment (make-vect 0.6 0.7)
                  (make-vect 0.7 0.8)) ; right cheek
    (make-segment (make-vect 0.7 0.8)
                  (make-vect 0.6 1.0)) ; right head
    (make-segment (make-vect 0.4 1.0)
                  (make-vect 0.3 0.8)) ; left head
    (make-segment (make-vect 0.3 0.8)
                  (make-vect 0.4 0.7)) ; left cheek
    (make-segment (make-vect 0.4 0.7)
                  (make-vect 0.4 0.6)) ; left neck
    (make-segment (make-vect 0.4 0.6)
                  (make-vect 0.2 0.5)) ; left shoulder
    (make-segment (make-vect 0.2 0.5)
                  (make-vect 0.0 0.6)) ; left forearem upper
    
    )))

(paint wave)