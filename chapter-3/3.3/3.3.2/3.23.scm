#lang sicp
(#%require "node.scm")
(#%provide (all-defined))

(define (make-deque) (cons '() '()))

(define (head deque) (car deque))

(define (tail deque) (cdr deque))

(define (set-head! deque item) (set-car! deque item))

(define (set-tail! deque item) (set-cdr! deque item))

(define (empty-deque? deque) (or (null? (head deque))
                                 (null? (tail deque))))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "FRONT-DEQUE called on an empty deque" deque)
      (val (car deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "REAR-DEQUE called on an empty deque" deque)
      (val (cdr deque))))

(define (front-insert-deque! deque item)
  (cond ((empty-deque? deque)
         (let ((new-node (make-node '() item '())))
           (set-head! deque new-node)
           (set-tail! deque new-node)))
        (else
         (let ((new-node (make-node '() item (head deque))))
           (set-prev! (head deque) new-node)
           (set-head! deque new-node)))))

(define (rear-insert-deque! deque item)
  (cond ((empty-deque? deque)
         (let ((new-node (make-node '() item '())))
           (set-head! deque new-node)
           (set-tail! deque new-node)))
        (else
         (let ((new-node (make-node (tail deque) item '())))
           (set-next! (tail deque) new-node)
           (set-tail! deque new-node)))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "FRONT-DELETE-DEQUE called on an empty deque" deque))
        (else
         (set-head! deque (next (head deque)))
         (if (not (empty-deque? deque))
             (set-prev! (head deque) '())))))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "REAR-DELETE-DEQUE called on an empty deque" deque))
        (else
         (set-tail! deque (prev (tail deque)))
         (if (not (empty-deque? deque))
             (set-next! (tail deque) '())))))
                

(define (print-deque deque)
  (define (print-node node)
    (if (null? node)
        '()
        (cons (val node) (print-node (next node)))))
  (print-node (head deque)))
