#lang sicp
; This is the solution I came up with
; I wanted to do it in an if clause,
; but that didn't work. See
; https://stackoverflow.com/questions/12183096/i-got-scheme-application-not-a-procedure-in-the-last-recursive-calling-of-a-fu
; for an explanation why. Basically, the if clause
; evaluates one expression, so (proc (car items) (for-each (cdr items))
; is trying to apply the procedure (proc (car items)) on the (for-each (cdr-items)).
; So, I wrote it in a cond-clause.
; It was cute to see someone else make the exact same journey on the wiki.
(define (my-for-each proc items)
  (cond ((null? items))
        (else (proc (car items))
              (my-for-each proc (cdr items)))))
(my-for-each (lambda (x) (newline) (display x))
             (list 1 2 3))

; this is another I found that I think is pretty smart.
; I jsut don't like the form so much, I can't explain why.
; I will say, though, that I added fucntionality for a
; null list, by making a preliminary check before running (iter items).
; Some users return #t on the fallback of the ifs. I saw one user that
; simply returned nothing if not. 
(define (my-for-each2 proc items)
  (define (iter things)
    (proc (car things))
    (if (not (null? (cdr things)))
        (iter (cdr things))
        ))
  (if (not (null? items))
      (iter items)
      ))
(my-for-each2 (lambda (x) (display (+ x 1)))
              (list 3 4 5))
(my-for-each2 (lambda (x) (display "proc"))
              '())

; Somebody wrote this. I don't agree.
; It returns a list of voids
(define my-for-each3 map)
(my-for-each3 (lambda (x) (display x))
              (list 5 6 7))

; Some people used lambda
; Maybe that is what cond clauses do?
(define (my-for-each4 proc items)
  (if (null? items)
      ((lambda ()
        (proc (car items))
        (my-for-each4 proc (cdr items))))))
(my-for-each4 (lambda (x) (display x))
              (list 7 8 9))