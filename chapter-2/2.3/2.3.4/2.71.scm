#lang sicp
(#%require "huffman-encoding-trees.scm")
(#%require "2.68.scm")
(#%require "2.69.scm")

(define alphabet '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))

(define (create-pairs n)
  (define (do-it i)
    (if (= i n)
        '()
        (cons (list (list-ref alphabet i) (expt 2 i)) (do-it (+ i 1)))))
  (if (> n 26)
      (error "ERROR -- n is too high" n)
      (do-it 0)))

(define n5 (create-pairs 5))
(define n10 (create-pairs 10))
(define n5-tree (generate-huffman-tree n5))
(define n10-tree (generate-huffman-tree n10))
(and (= (length (encode (list (list-ref alphabet (- (length n5) 1))) n5-tree)) 1)
     (= (length (encode (list (list-ref alphabet (- (length n10) 1))) n10-tree)) 1)
     (= (length (encode (list 'A) n5-tree)) (- 5 1))
     (= (length (encode (list 'A) n10-tree)) (- 10 1)))
