#lang sicp
(define (make-mobile left right)
  (cons left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (make-branch length structure)
  (cons length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0)
        ((number? (branch-structure mobile)) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

(define (torque branch)
  (* (branch-length branch) (total-weight branch)))

(define (balanced? mobile)
  (if (not (pair? mobile))
      #t
      (and (= (torque (left-branch mobile))
              (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))))
                      

(define b1 (make-branch 3 4))
(define b2 (make-branch 4 7))

(define m0 (make-mobile b1 b1)) ; balanced
(define m1 (make-mobile b1 b2)) ; not balanced

(define b3 (make-branch 4 m0)) ; branch's mobile is balanced
(define m2 (make-mobile b1 b3)) ; not balanced

(define b4 (make-branch 2 m2)) ; branch's mobile is not balanced
(define m3 (make-mobile b3 b4)) ; not balanced

(define b5 (make-branch 7 m3)) ; branch's mobile is not balanced
(define m4 (make-mobile b5 b5)) ; not balanced

(define b6 (make-branch 11 b5)) ; branch's mobile is not balanced
(define m5 (make-mobile b6 b4)) ; not balanced

(define m6 (make-mobile b3 b3)) ; balanced
(define b7 (make-branch 7 m6)) ; branch's mobile is balanced

(define m7 (make-mobile b7 b7)) ; balanced

(for-each (lambda (m)
            (display "Mobile ")
            (display "total weight ")
            (display (total-weight m))
            (display " balanced? ")
            (display (balanced? m))
            (newline))
          (list m0 m1 m2 m3 m4 m5 m6 m7))

                      
