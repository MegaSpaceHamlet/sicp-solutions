#lang sicp
(define (abs x)
  (if (< x 0)
      (* x -1)
      x))

(define (close-enough? a b)
  (let ((tolerance 0.00001))
    (< (abs (- a b)) tolerance)))
        
; cont-frac recursive
(define (cont-frac n d k)
  (define (do-cont-frac i n d k)
  (if (> i k)
      (/ (n i) (d i))
      (+ (d i) (/ (n i) (do-cont-frac (+ i 1) n d k)))))
  (do-cont-frac 0 n d k))


(define (cf x)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             x))



; This is a procedure to test at what term k
; will we reach four decimal point precision.
; The answer is 10.
;
; I know there's a more general formula
; for testing precision accodring to decimal
; place, but it didn't seem necessary to do
; all the research for this exercise.
; Nevertheless, it's a worthy algorithm to
; investigate and integrate.

(define (four-decimal-points)
  (define (do-test i)   
      (if ((lambda (x)
             (let ((golden-ratio 1.6180))
               (and (> x golden-ratio) (< x (+ golden-ratio 0.0001)))))
           (cf i))
          i
          (do-test (+ i 1))))
    (do-test 1))
               