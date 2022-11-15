#lang sicp
(#%require "sets-as-binary-trees.scm")
(#%require "../../../list-functions.rkt")

(define (lookup key set)
  (cond ((null? set) false)
        ((= key (entry set)) (entry set))
        ((< key (entry set)) (lookup key (left-branch set)))
        ((> key (entry set)) (lookup key (right-branch set)))))
