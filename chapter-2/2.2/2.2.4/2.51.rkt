#lang racket
(require sicp-pict)

(define (below p1 p2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
           (transform-painter p1
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-above
           (transform-painter p2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
  (lambda (frame)
    (paint-below frame)
    (paint-above frame)))))

(define (below p1 p2)
  (rotate90
   (beside
    (rotate270 p1)
    (rotate270 p2))))

(paint (below einstein mark-of-zorro))
                              