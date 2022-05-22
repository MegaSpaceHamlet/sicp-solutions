#lang sicp
(#%require "2.2.rkt")
;;;
; 1. Started out with just width & height
; (make-rect w h) (const w h)
; (width rect) (car rect)
; (height rect) (cdr rect)
; The perim & area procedures were exactly the same
;
; 2. Then made the rectangle represented as 2 points,
; a beginning and end. the width and height procedures
; changed, but perim and rect did not
;
; 3. Now, to make them as 2 lines
;    Here we are in 2.3-alt-rep.rkt
;    And everything is working as it
;    is supposed to.
;;; 

(define (make-rect width-line height-line)
  (cons width-line height-line))

(define (width-line rect)
  (car rect))

(define (height-line rect)
  (cdr rect))

(define (width rect)
  (abs (- (x-point (end-segment (width-line rect)))
          (x-point (start-segment (width-line rect))))))

(define (height rect)
  (abs (- (y-point (end-segment (height-line rect)))
          (y-point (start-segment (height-line rect))))))

(define (rect-perim rect)
  (* 2 (width rect) (height rect)))

(define (rect-area rect)
  (* (width rect) (height rect)))

(define r (make-rect (make-segment (make-point 0 0) (make-point 10 0))
                     (make-segment (make-point 0 0) (make-point 0 5))))
(rect-perim r)
(rect-area r)