#lang racket
(require sicp-pict)

(define (flip-horiz painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)))

(paint einstein)
(paint (flip-horiz einstein))

(define (rotate painter n)
  (if (= n 0)
      painter
      (rotate (rotate90 painter) (- n 1))))

(define (rotate180 painter)
  (rotate painter 2))

(define (rotate270 painter)
  (rotate painter 3))


(paint (rotate90 einstein))
(paint (rotate180 einstein))
(paint (rotate270 einstein))