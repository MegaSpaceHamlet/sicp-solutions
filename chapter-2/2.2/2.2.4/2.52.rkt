#lang racket
(require sicp-pict)

; a - add segements to wave
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
    ;;; additions here 
    (make-segment (make-vect 0.4 0.8)
                  (make-vect 0.5 0.7)) ; left lip
    (make-segment (make-vect 0.5 0.7)
                  (make-vect 0.6 0.8)) ; right lip
    (make-segment (make-vect 0.45 0.85)
                  (make-vect 0.45 0.9)) ; left eye
    (make-segment (make-vect 0.55 0.85)
                  (make-vect 0.55 0.9)) ; right eye
    
    )))

(paint wave)


; b - corner-split

; necessary split functions
(define (split p1 p2)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split p1 p2) painter (- n 1))))
          (p1 painter (p2 smaller smaller))))))
(define up-split (split below beside))
(define right-split (split beside below))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split wave 1))

; c - square limit

; necessary functions
(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs painter)
  (square-of-four identity flip-vert
                  identity flip-vert))


; make all painters point inwards
(define (square-limit painter n)
  (let ((combine4 (square-of-four identity flip-horiz
                                  (lambda (frame)
                                    (flip-horiz
                                     (rotate180 frame)))
                                  (lambda (frame)
                                    (flip-horiz
                                     (flip-vert frame))))))
    (combine4 (corner-split painter n))))

(paint (square-limit einstein 1))
