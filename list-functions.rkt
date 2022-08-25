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

(define (accumulate-list comb base args)
  (if (null? args)
      base
      (accumulate-list comb (comb base (car args)) (cdr args))))
             