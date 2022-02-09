#lang sicp
(define (factorial n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

; Formula to retrieve elements in Pascal's Triangle. nth row, rth element
; I wrote this procedure right when I found the binomial co-efficients formula
; However, I thought that I needed to create a function that would YIELD every
; element in the triangle up until, and including, the desired row (n).
;
; After thinking about it for a bit, I decided to check online.
; http://community.schemewiki.org/?sicp-ex-1.12
; Over there, I found 2 things:
; 1) First of all, the main given solutions only returned the element at the specified position!
;    So the functions were taking 2 arguements, not just one. And, they were not yielding the results
;    per iteration, rather, they only returned the single element.
; 2) Furthermore, at the bottom of the page, was a procedure which used binomial coefficients. And
;    not even as good as me. Not only was the code "dirtier", but it didn't start counting from 0.
;    Which is weird, and unneccessary.
; So basically, what I'm trying to say is that I got the solution right away, and I'm a freaking boss. 
(define (pascal-elm n r)
      (/ (factorial n) (* (factorial r) (factorial (- n r)))))
 

; The main answer online
; I can see how this is simpler
; Also, it's much more "recursive" in that it performs a simple calculation against a base case,
; and calls itself otherwise.
; Whereas, the above function does the fomula, using a recursive factorial process
; This is the correct answer. Simple, succint, and most important - recursive.
(define(pascal r c)
  (if (or (= c 0) (= c r))
      1
      (+ (pascal (- r 1) (- c 1)) (pascal ( - r 1) c))))


;;; Examples
(pascal-elm 5 4)
(pascal 5 4)
(display '-----) (newline)
(pascal-elm 4 2)
(pascal 4 2)