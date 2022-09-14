#lang sicp
(#%provide (all-defined))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (length-i items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))
(define (reverse-r items)
  (if (null? (cdr items))
      items
      (append (reverse-r (cdr items)) (list (car items)))))
(define (reverse-i items)
  (define (reverse-aux a b)
    (if (null? a)
        b
        (reverse-aux (cdr a) (cons (car a) b))))
  (reverse-aux items nil))

; my version before coming across the book's
; fold-left without the helper function
; result is stored in base
(define (accumulate-list comb base args)
  (if (null? args)
      base
      (accumulate-list comb (comb base (car args)) (cdr args))))

; the book's
(define (accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (accumulate op initial (cdr seq)))))

(define (accumulate-n op initial seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op initial (map (lambda (s) (car s)) seqs))
            (accumulate-n op initial (map (lambda (s) (cdr s)) seqs)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (deep-reverse items)
  (define (do-deep-reverse items result)
    (cond ((null? items) result)
          ((pair? (car items)) (do-deep-reverse (cdr items) (cons (do-deep-reverse (car items) nil) result)))
          (else (do-deep-reverse (cdr items) (cons (car items) result)))))
  (do-deep-reverse items nil))

(define (fringe-cons items)  
  (define (fringe-iter items result) 
    (cond ((null? items) result) 
          ((pair? items) (fringe-iter (car items) (fringe-iter (cdr items) result))) 
          (else (cons items result)))) 
  (fringe-iter items nil))

(define (tree-map fn tree)
  (map
   (lambda (sub-tree)
     (if (pair? sub-tree)
         (tree-map fn sub-tree)
         (fn sub-tree)))
   tree))

; my personal helper function to test working with larger lists, where the elements don't matter
(define (create-list n)
  (if (= n 0)
      nil
      (cons n (create-list (- n 1)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

; fringe from 2.28
; apparently, they used the append method
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else
         (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap
   (lambda (i)
         (map (lambda (j)
                (list j i))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

