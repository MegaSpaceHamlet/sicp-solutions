#lang sicp
; my solution
(define (adjoin-set x set)
  (define (helper passed ahead)
    (if (null? ahead)
        passed
        (let ((elm (car ahead)))
          (cond ((> x elm) (helper (append passed (list elm)) (cdr ahead)))
                ((= x elm) (append passed ahead)) ; x exists in set; return original set
                ((< x elm) (append passed (cons x ahead))) ; x is bigger than current elm, place before
                ))))
  (helper '() set))

; the right solution (community.schemewiki.org/?sicp-ex-2.61)
(define (adjoin-set x set) 
  (cond ((null? set) (list x)) 
        ((= x (car set)) set) 
        ((< x (car set)) (cons x set)) 
        (else (cons (car set) (adjoin-set x (cdr set))))))                            
