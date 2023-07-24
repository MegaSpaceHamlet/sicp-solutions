#lang sicp
(#%provide (all-defined))
;;;
; Node
;
; The kuntz here is to create the pointer to the previous node as a lambda function
; that is invoked when calling `prev` on a node.
; This way, if the `prev` node links to the current node, or another node that has
; the very same `prev` node as it's own previous node, the interpreter will not
; fall into the infinite loop problem, being as `prev` was not called on it.
; Therefore, it will not attempt to print the list that the previous pointer is
; pointing to. Only when `prev` is directly called on a node will the list that
; the previous pointer is pointing to be printed.
;
;
; Courtesy of 'wtative', the top answer at http://community.schemewiki.org/?sicp-ex-3.23
;;;

(define (make-node prev val next)
  (list (lambda () prev) val next))

(define (prev node)
  (if (null? (car node))
      '()
      ((car node))))

(define (val node) (cadr node))

(define (next node) (caddr node))

(define (set-prev! node prev) (set-car! node
                                        (lambda () prev)))

(define (set-val! node v) (set-car! (cdr node) v))

(define (set-next! node next) (set-car! (cdr (cdr node)) next))