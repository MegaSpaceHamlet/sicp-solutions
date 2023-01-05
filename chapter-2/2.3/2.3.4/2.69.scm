#lang sicp
(#%require "huffman-encoding-trees.scm")
(#%require "2.68.scm")
(#%provide (all-defined))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

; http://community.schemewiki.org/?sicp-ex-2.69
; I originally wrote GPE's solution, but felt something was wrong.
; Instead of `adjoin-set`, I was using `cons`. The first element kept
; on accumulating weight, so the tree wasn't encoding properly.
; This is Chris' answer
; The key is to keep the set ordered as we merge. 
(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set))
      (car leaf-set)
      (successive-merge (adjoin-set (make-code-tree
                                     (cadr leaf-set)
                                     (car leaf-set))
                                    (cddr leaf-set)))))

(define pairs (list (list 'A 8)
                    (list 'B 3)
                    (list 'C 1)
                    (list 'D 1)
                    (list 'E 1)
                    (list 'F 1)
                    (list 'G 1)
                    (list 'H 1)))

(define pairs2 (list (list 'A 3)
                     (list 'B 5)
                     (list 'C 6)
                     (list 'D 6)))

(define tree (generate-huffman-tree pairs))

; test
; (encode '(A B C D) tree)