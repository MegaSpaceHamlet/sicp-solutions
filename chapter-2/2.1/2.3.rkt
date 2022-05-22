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
;    Check out 2.3-alt-rep.rkt
;    (Alternative Representation)
;;;

(define (make-rect begin-point end-point)
  (cons begin-point end-point))

(define (begin-point rect)
  (car rect))

(define (end-point rect)
  (cdr rect))

(define (width rect)
  (abs (- (x-point (end-point rect)) (x-point (begin-point rect)))))

(define (height rect)
  (abs (- (y-point (end-point rect)) (y-point (begin-point rect)))))

(define (rect-perim rect)
  (* 2 (width rect) (height rect)))

(define (rect-area rect)
  (* (width rect) (height rect)))

(define r (make-rect (make-point 0 0) (make-point 10 5)))
(rect-perim r)
(rect-area r)