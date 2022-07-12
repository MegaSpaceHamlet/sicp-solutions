#lang sicp
(#%require "2.1.4-extended-exercise.rkt")
;; Reading the community.schemewiki.org?sicp-ex-2.9 answer,
;; I realize that I completely missed the point of the exercise.
;; The function was supposed to take 2 intervals, and produce a
;; new width.
;; Within that function, we were supposwed to be able to see
;; how the width was a function of 2 widths.
;; The thing is, that for multiplication and division,
;; the answer does not come out to be the same
;; for equal widths. Thus, we cannot conclude that
;; the function is operating on 2 widths.
;; According to that, the procudure would look
;; like this:
(define (add-width a b)
  (/ (- (+ (upper-bound a) (upper-bound b))
        (+ (lower-bound a) (lower-bound b)))
     2))
(define (mul-width a b)
  (/ (- (* (upper-bound a) (upper-bound b))
        (* (lower-bound a) (lower-bound b)))
     2))
(define ng-five (make-interval -5 5))
(define sm (make-interval 0 2))
;; add-width = 6
;; mul-width = 5
(define other-five (make-interval 0 10))
;; add-width = 6
;; mul-width = 10
;; Thus you see, that the function cannot
;; just accept the widths of 2 intervals


; My original thinking
(define (interval-width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (print-interval-width w)
  (to-fixed w 2))

(define (add-interval-widths a b)
  (+ a b))

(define (sub-interval-widths a b)
  (- a b))

(define (mul-interval-widths a b)
  (* a b))

(define (div-interval-widths a b)
  (/ a b))

(define sum (add-interval-widths
             (interval-width a)
             (interval-width b)))

(define diff (sub-interval-widths
              (interval-width b)
              (interval-width a)))

; Wrong - it multiplies width by width
; We need to multiply the width by an int n
(define prod1 (mul-interval-widths
              (interval-width a)
              (interval-width b)))

(define prod2 (mul-interval-widths
               (interval-width a)
               3))

; Wrong - it divides width by width
; We need to divide the width by an int n
(define quotient1 (div-interval-widths
                   (interval-width b)
                   (interval-width a)))

(define q2 (div-interval-widths
            (interval-width b)
            4))
                   

