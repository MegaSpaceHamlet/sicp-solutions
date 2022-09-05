#lang sicp
; deep map using list vs. cons and cdr
(define (deep-map-list fn lol)
  (if (list? lol)
      (map (lambda (child) (deep-map-list fn child))
           lol)
      (fn lol)))

(define (deep-map fn lol) ; list of lists
  (cond ((null? lol) nil)
        ((list? lol)
         (cons (deep-map fn (car lol))
               (deep-map fn (cdr lol))))
        (else (fn lol))))

; the advantage of using either/or depends on the data structure
; and the needs of the program. Whichever is more helpful in a
; particular situation is better to use.

; depth-first-search vs. breadth-first
; (make-tree), (datum tree), and (children tree) were all defined in lecture 12.
(define make-tree cons)
(define datum car)
(define children cdr)

(define (leaf? node)
  (null? (children node)))

(define (leaves . seq)
  (map (lambda (x) (make-tree x nil)) seq))

; depth-first is straigtforward and simple. You're going in the direction of the data
(define (depth-first-search tree)
  (display (datum tree))
  (for-each depth-first-search (children tree)))
; Variations
; 1. In Order [3 + (4 * 5)]
; 2. Pre-Order [(+ 3 (* 4 5))]
; 3. Post-Order [3 4 5 * +]

; Breadth-first search is more complicated and requires another data structure, the queue.
; The queue is a FIFO - first-in, first-out data structure, just like a regular line in
; real life.
; As we cdr through the list, we append the children of each node to the end of the queue.
(define (breadth-first-search tree)
  (bfs-iter (list tree)))

(define (bfs-iter queue)
  (if (null? queue)
      (display "done")
      (let ((task (car queue)))
        (display (datum task))
        (bfs-iter (append (cdr queue) (children task))))))

; We could, of course, add a function to operate on each element.
; Use cases:
; 1. To assess all possibilites, without actaully plumbing to the depths of every single one. E.g. chess
; 2. To get the minimal answer - the pitcher-pouring example. On each task, check if it's a leaf, aka
;    fulfills some required predicate.
(define t1
  (make-tree 1
             (list (make-tree 2 (leaves 3 4))
                   (make-tree 5 (leaves 6 7 8)))))

(breadth-first-search t1)