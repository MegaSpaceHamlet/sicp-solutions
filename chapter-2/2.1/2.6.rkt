#lang sicp
;;; Church Numerals
;     Not really "numbers" as we usually
;     use the term. Numbers in the sense
;     of, "how many times is this proce-
;     dure applied?"
;;;
(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (addition m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


;;; Church Numerals used to represent regular numbers
;     By using inc as an example, it is easy to perc-
;     eive the relationship between the "Church Nume-
;     rals" and regular numerals. For the same reason,
;     the arguement will always be zero.
;
;     If the function was square and the arguement was
;     4, then 'zero' would produce 4, 'one' would pro-
;     duce 16, and 'two' would produce 256, and so on.
;
;     Every Church Numeral requires a function and an
;     argument. The procedure to be applied, and the
;     argument on which to apply. Church 'zero' means
;     "don't apply". 'one' means apply once. 'two' --
;     twice. And so on. 'addition' means to apply the
;     procedure m + n times, and 'add-1' simply means
;     that -- to add 1.
;;;
(define c-0 ((zero inc) 0))
(define c-1 ((one inc) 0))
(define c-2 ((two inc) 0))
(define c-3 (((addition one two) inc) 0))
(define c-4 (((addition two two) inc) 0))
(define c-5 (((add-1 (addition two two)) inc) 0))
