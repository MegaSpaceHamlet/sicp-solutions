#lang sicp
(#%require "sets-as-binary-trees.scm")
(#%require "../../../list-functions.rkt")

(define t1 (make-tree
            7
            (make-tree
             3
             (make-tree 1 '() '())
             (make-tree 5 '() '()))
            (make-tree
             9
             '()
             (make-tree 11 '() '()))))

(define t2 (make-tree
            3
            (make-tree 1 '() '())
            (make-tree 7
                       (make-tree 5 '() '())
                       (make-tree 9
                                  '()
                                  (make-tree 11 '() '())))))

(define t3 (make-tree
            5
            (make-tree 3
                       (make-tree 1 '() '())
                       '())
            (make-tree 9
                       (make-tree 7 '() '())
                       (make-tree 11 '() '()))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define trees (list t1 t2 t3))

(for-each (lambda (i)
            (display "Tree ") (display (+ i 1))
            (newline)
            (display "Tree->list-1: ") (display (tree->list-1 (list-ref trees i)))
            (newline)
            (display "Tree->list-2: ") (display (tree->list-2 (list-ref trees i)))
            (newline))
          (enumerate-interval 0 2))