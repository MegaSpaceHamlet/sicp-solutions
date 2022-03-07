#lang sicp

(define (f g) (g 2))

; In applicative-order subsitution, the procedure fails.
; It ends up saying "Do the function [2] on the value [2]",
; but then [2] ain't a function.

; In normal-order subsitution, I have a feeling that the
; interpreter will run out of memory at some point.
; It'll just keep on expanding. 