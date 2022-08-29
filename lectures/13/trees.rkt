#lang sicp
; tree-map
(define (tree-map fn tree)
  (map
   (lambda (sub-tree)
     (if (pair? sub-tree)
         (tree-map fn sub-tree)
         (fn sub-tree)))
   tree))

; cons and cdr
(define (deep-map fn lol) ; list of lists
  (cond ((null? lol) nil)
        ((list? lol)
         (cons (deep-map fn (car lol))
               (deep-map fn (cdr lol))))
        (else (fn lol))))