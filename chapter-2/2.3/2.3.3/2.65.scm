#lang sicp
(#%require "sets-as-binary-trees.scm")
(#%require "sets-as-ordered-lists.scm") ; O(n) implementation of intersection-set
(#%require "2.62.scm") ; O(n) implementation of union-set

(define (union-set-tree t1 t2)
  (let ((l1 (tree->list t1)) (l2 (tree->list t2)))
    (list->tree (union-set l1 l2))))

(define (intersection-set-tree t1 t2)
  (let ((l1 (tree->list t1)) (l2 (tree->list t2)))
    (list->tree (intersection-set l1 l2))))

(define t4 (list->tree (list 1 3 5 7 10 11 13 15 17 20 22 25 28 30)))

(tree->list (union-set-tree t1 t4))
(tree->list (intersection-set-tree t1 t4))
                                   
                                              
                                              
                                   