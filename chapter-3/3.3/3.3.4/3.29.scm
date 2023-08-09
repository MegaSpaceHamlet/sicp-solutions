#lang sicp

; or-gate as a compound of and-gates and inverters
; a or b = !(!a && !b)
; if one or more are true, the (!a && !b) will evaluate to false,
; and the invert of that will be true
; if both are false, the (!a && !b) will be true, and the invert false
;
; quite clever
(define (or-gate a1 a2 output)
  (let ((not-a1 (make-wire))
        (not-a2 (make-wire))
        (and-both (make-wire)))
    (invert a1 not-a1)
    (invert a2 not-a2)
    (and-gate not-a1 not-a2 and-both)
    (invert and-both output)
    'ok))

; the delay will be invert-delay * 3 + and-gate-delay
  