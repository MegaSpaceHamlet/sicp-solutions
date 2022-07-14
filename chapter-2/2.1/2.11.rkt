#lang sicp
(#%require "2.1.4-extended-exercise.rkt")
(define pos? positive?)

(define (mul-interval-enhanced x y)
  (let ((xl (lower-bound x))
        (xu (upper-bound x))
        (yl (lower-bound y))
        (yu (upper-bound y)))
  (cond ((and (pos? xl) (pos? xu) (pos? yl) (pos? yu))
         ; 1. All are positive 
         (make-interval (* xl yl)
                        (* xu yu)))
        ((and (neg? xl) (neg? xu) (neg? yl) (neg? yu))
         ; 2. All are negative. The absolute values of the lower-bounds are higher
         (make-interval (* xu yu)
                        (* xl yl)))
        ((and (neg? xl) (pos? xu) (neg? yl) (pos? yu))
         ; 3. Both lower-bounds are negative. Upper-bounds are pos
         ; *** This is the case that requires more than 2 multiplications ***
         ; If the product of the abs values of the lower-bounds is greater than
         ; the product of the upper-bounds, we need to multiply the lower bounds
         ; Similarly, if the product of the upper-bound x and lower-bound y is
         ; less than the product of lower-bound x and upper-bound y, we need that
         ; product for the minimum.
         (let ((min1 (* xl yu))
               (min2 (* xu yl))
               (max1 (* xl yl))
               (max2 (* xu yu)))
           (make-interval (min min1 min2)
                          (max max1 max2))))
        ((and (neg? xl) (neg? xu) (pos? yl) (pos? yu))
         ; 4. First interval is all neg. Second, all pos
         (make-interval (* xl yu)
                        (* xu yl)))
        ((and (pos? xl) (pos? xu) (neg? yl) (neg? yu))
         ; 5. Opposite of above
         (make-interval (* xu yl)
                        (* xl yu)))
        ((and (neg? xl) (pos? xu) (pos? yl) (pos? yu))
         ; 6. Only lower-bound of first interval is neg. Rest are pos
         (make-interval (* xl yu)
                        (* xu yu)))
        ((and (pos? xl) (pos? xu) (neg? yl) (pos? yu))
         ; 7. Only lower-bound of second interval is neg. Rest pos
         (make-interval (* xu yl)
                        (* xu yu)))
        ((and (neg? xl) (pos? xu) (neg? yl) (neg? yu))
         ; 8. Only upper-bound of first interval is pos. Rest are neg
         (make-interval (* xu yl)
                        (* xl yl)))
        ((and (neg? xl) (neg? xu) (neg? yl) (pos? yu))
         ; 9. Only upper-bound of second interval is pos. Rest are neg
         (make-interval (* xl yu)
                        (* xl yl)))
        )))

(define (print-enhanced-mul pattern num a b)
  (display num)
  (display ". ")
  (display pattern)
  (display " (")
  (print-interval a)
  (display ")")
  (display " * ")
  (display "(")
  (print-interval b)
  (display ")")
  (display " = ")
  (print-interval (mul-interval-enhanced a b))
  (newline))

; All pos
(define test1 (make-interval 1 2))
(define test2 (make-interval 3 4))
; All neg
(define test-neg1 (make-interval -1 -2))
(define test-neg2 (make-interval -3 -2))
; lower-bounds neg, upper pos
(define t-ln1 (make-interval -5 5))
(define t-ln2 (make-interval -4 3))



; Print
(define (do-test)
  (print-enhanced-mul "+ + + +" 1 test1 test2)
  (print-enhanced-mul "- - - -" 2 test-neg1 test-neg2)
  (print-enhanced-mul "- + - + -> THE IMPORTANT ONE!" 3 t-ln1 t-ln2)
  (print-enhanced-mul "- - + +" 4 test-neg1 test1)
  (print-enhanced-mul "+ + - -" 5 test1 test-neg1)
  (print-enhanced-mul "- + + +" 6 t-ln1 test2)
  (print-enhanced-mul "+ + - +" 7 test2 t-ln1)
  (print-enhanced-mul "- + - -" 8 t-ln2 test-neg2)
  (print-enhanced-mul "- - - +" 9 test-neg2 t-ln2)
  )