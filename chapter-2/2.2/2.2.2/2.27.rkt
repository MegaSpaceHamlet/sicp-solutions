#lang sicp
(#%require "../../../list-functions.rkt") ; for create-list
(define l1 (list (list 1 2) (list 3 4)))
(define l2 (list 1 2 3 4))
(define l3 (list 1 2 (list 3 4)))
(define l4 (list l1 l1))
(define l5 (list l1 l2 l3 l4))

; This is the original procedure that I wrote immediately.
; It passed the test of the list l1, the one given in the book.
; It did not, however, pass the l4 test, the one with a third-
; tier list.
; The reason for that is because upon reaching a pair, I would
; reverse that pair. But what if that pair contained another pair?
; I realized I had to re-write my procedure.
(define (deep-reverse-broken x)
  (define (do-deep-reverse-broken x y)
    (cond ((null? x) y)
          ((not (pair? (car x))) (do-deep-reverse-broken (cdr x) (cons (car x) y)))
          (else (do-deep-reverse-broken (cdr x) (cons (reverse (car x)) y)))))
  (do-deep-reverse-broken x nil))

(for-each (lambda (l)
            (display l) (newline)
            (display (deep-reverse-broken l)) (newline) (newline))
          (list l1 l2 l3 l4))

;;; This is the correct method
; 1. Is item null? return result
; 2. Is car of items pair? do deep-reverse with rest of list as items, cons a NEW deep-reverse
;    of car by giving result of nil, to result
; 3. Item is an atom - cons to result and cdr down the list
;
; The main difference here is that when hitting a pair, I would create a nother deep-reverse list,
; and cons that to the result, thus preserving the list hierarchy structure. 
(define (deep-reverse items)
  (define (do-deep-reverse items result)
    (cond ((null? items) result)
          ((pair? (car items)) (do-deep-reverse (cdr items) (cons (do-deep-reverse (car items) nil) result)))
          (else (do-deep-reverse (cdr items) (cons (car items) result)))))
  (do-deep-reverse items nil))

(for-each (lambda (l)
            (display l) (newline)
            (display (deep-reverse l)) (newline) (newline))
          (list l1 l2 l3 l4 l5))

; Check out this test
(define l6 (list (create-list 100000) (list (create-list 10000) (create-list 1000)) (create-list 3000)))
(define l6-reversed-newline (list (reverse (create-list 3000)) (list (reverse (create-list 1000)) (reverse (create-list 10000))) (reverse (create-list 100000))))

(equal? l6-reversed-newline (deep-reverse l6))
