#lang sicp
(define (make-mobile left right)
  (list left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (make-branch length structure)
  (list length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (if (null? (cdr (cdr branch)))
      (car (cdr branch))
      (cdr branch)))

(define (get-branch-weight branch)
  (cond ((not (pair? branch)) 0)
        ((number? (branch-structure branch)) (branch-structure branch))
        (else (+ (get-branch-weight (left-branch branch))
                 (get-branch-weight (right-branch branch))))))


;(define (total-weight mobile)
;  (+ (get-branch-weight (left-branch mobile))
;     (get-branch-weight (right-branch mobile))))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0)
        ((number? (branch-structure mobile)) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

(define b1 (make-branch 3 4))
(define b2 (make-branch 4 7))

(define m0 (make-mobile b1 b1))
(define m1 (make-mobile b1 b2))

(define b3 (make-branch 4 m0))
(define m2 (make-mobile b1 b3))

(define b4 (make-branch 2 m2))
(define m3 (make-mobile b3 b4))

(define b5 (make-branch 7 m3))
(define m4 (make-mobile b5 b5))

(define b6 (make-branch 11 b5))
(define m5 (make-mobile b6 b4))

(define m6 (make-mobile b3 b3))
(define b7 (make-branch 7 m6))

(define m7 (make-mobile b7 b7))

;(for-each (lambda (m) (display m) (newline)
;            (display (total-weight m)) (newline) (newline))
;          (list m1 m2 m3 m4 m5))

(define (torque branch)
  (* (branch-length branch) (total-weight branch)))

; (torque b1)

(define (balanced? mobile)
  (and (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       (if (pair? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           #t)
       (if (pair? (branch-structure (right-branch mobile)))
           (balanced? (branch-structure (right-branch mobile)))
           #t)))