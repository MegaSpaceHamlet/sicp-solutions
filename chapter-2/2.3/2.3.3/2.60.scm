#lang sicp

; same time 
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; now constant time
(define (adjoin-set x set) (cons x set))

; 0((length set1)), as opposed to 0(n^2)
(define (union-set set1 set2)
  (append set1 set2))

; this implementation assumes that we want an intersection of duplicates
; meaning if there's 1 element in set1 and 2 elements of the same value in
; set2, we will only add the element once to the intersection.
; If there were 2 elements of the same value in each set, then we would
; add 2 to the intersection.
; Let's think about the opposite case. set1 has an element of the same value 3 times.
; set2 only has it once. How many times should it be added to the intersection? Once, or thrice?
; Another implementation might say thrice. There's allowed to be duplicates after all.
; That implementation will be presented in the next procedure (after remove, a helper to this implementation).
;
; Time Complexity: This procedure will take even longer than the previous one, because after checking if the
; element already exists in the set, which is 0(n), the remove procedure is called which is 0(n) as well
; (if the last element of the list is the one to be removed), making this procedure a whopping 0(n^3).
; The second implementation is the same as before - 0(n^2).
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) (remove (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))

; removes only first instance of element in set. set is allowed to have duplicates
(define (remove item set)
  (define (remover filtered remaining)
    (cond ((null? remaining) filtered)
          ((equal? item (car remaining)) (append filtered (cdr remaining)))
          (else (remover (append (list (car remaining)) filtered) (cdr remaining)))))
  (remover '() set))

; the second implementation of intersection
(define (intersection-set2 set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1)
                                                 (intersection-set2 (cdr set1) set2)))
        (else (intersection-set2 (cdr set1) set2))))

(define s1 (list 1 1 2 3 2 4 5 4 5 8 8))
(define s2 (list 4 5 3 6 6 7 8 1 4 9 8))
(element-of-set? 8 s1)
(adjoin-set 1 s1)
(union-set s1 s2)
(intersection-set s1 s2)
(intersection-set s1 (adjoin-set 1 s2))
(intersection-set2 s1 (adjoin-set 2 s2))

; As far as which applications what would be useful for:
; In a system of unique ids, for example, listing all
; employees in a warehouse, non-duplicate sets would be required.
; If I had a list of tickets in a raffle that people bought, and
; each ticket was labeled by id of the purchaser, and I was doing
; a raffle, a set with duplicates would work.
; Just a small example. 
