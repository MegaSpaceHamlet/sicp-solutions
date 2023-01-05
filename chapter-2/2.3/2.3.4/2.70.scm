#lang sicp
(#%require "huffman-encoding-trees.scm")
(#%require "2.68.scm")
(#%require "2.69.scm")

(define pairs (list
               (list 'A 2)
               (list 'BOOM 1)
               (list 'GET 2)
               (list 'JOB 2)
               (list 'NA 16)
               (list 'SHA 3)
               (list 'YIP 9)
               (list 'WAH 1)))
(define tree (generate-huffman-tree pairs))

(define song
  '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define bits (encode song tree))
; (length bits) = 84