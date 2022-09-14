#lang sicp
(#%require "../../../functions.rkt")
(#%require "../../../list-functions.rkt")
(define (unique-pairs n)
  (flatmap
   (lambda (i)
         (map (lambda (j)
                (list j i))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

; dependencies for prime-sum-pairs
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       ; enhancement. Instead of directly writing out the nested mapping,
       ; unique-pairs provides them
        (filter prime-sum? (unique-pairs n))))

(unique-pairs 10)
(prime-sum-pairs 10)

         