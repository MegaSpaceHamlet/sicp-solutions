#lang sicp
(define l (list 1 (list 2 (list 3 4) 5) (list 6 7)))
        

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(scale-tree l 10)

(define (scale-tree-map tree factor)
  (map
   (lambda (sub-tree)
     (if (pair? sub-tree)
         (scale-tree-map sub-tree factor)
         (* sub-tree factor)))
   tree))

(scale-tree-map l 10)
