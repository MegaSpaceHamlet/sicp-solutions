#lang sicp
(#%require "sets-as-unordered-lists.scm")
(#%require "../../../list-functions.rkt")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2)
         (union-set (cdr set1) set2))
        (else (cons (car set1) (union-set (cdr set1) set2)))))

(define (union-set2 set1 set2)
  (define (helper set)
    (cond ((null? set) '())
          ((element-of-set? (car set) set2)
           (helper (cdr set)))
          (else (cons (car set) (helper (cdr set))))))
  (append (helper set1) set2))

(define (union-set3 set1 set2)
  (cond ((null? set2) set1)
        ((element-of-set? (car set2) set1) (union-set3 set1 (cdr set2)))
        (else (union-set3 (append set1 (list (car set2))) (cdr set2)))))

; found this one online. in the spirit of sicp
; http://community.schemewiki.org/?sicp-ex-2.59, user 'Lambdalef'
(define (union set1 set2) 
   (accumulate adjoin-set set2 set1)) 

(define s1 (list 1 2 3 4 5))
(define s2 (list 3 4 5 6 7))
(union-set s1 s2)
(union-set2 s1 s2)
(union-set3 s1 s2)
(union s1 s2)

; solution number one fastest in terms of time complexity, but high in terms of space complexity
; solution 2 is great on the space factor, but append incurs as extra cost