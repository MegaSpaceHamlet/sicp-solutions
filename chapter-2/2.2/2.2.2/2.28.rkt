#lang sicp
(#%require "../../../list-functions.rkt")
(define l1 (list (list 1 2) (list 3 4)))
(define l2  (list (list 1) (list 3 4)))

; This was the answer I got to on my own. It felt... wrong.
; Not that it wasn't returning the expected results, but
; the form seemed extraneous. Intuitively, I felt, it could
; be simpler, formulated into a 3-rule procedure.
(define (fringe-original x)
  (cond ((null? (cdr x))
         (if (pair? (car x))
             (fringe-original (car x))
             (list (car x))))
        ((not (pair? (car x))) (append (list (car x)) (fringe-original (cdr x))))
        (else (append (fringe-original (car x)) (fringe-original (cdr x))))))

; On community.schemewiki.org, I found what I was looking for.
; Update: this is the same algorithm (in principle, the order is slightly
;         different, but that doens't affect the result) used by the authors
;         later in the chapter. See 2.2.3/sequence-operations.rkt, function
;         'enumerate-tree'.
(define (fringe-append x)
  (cond ((null? x) nil)
        ((pair? x) (append (fringe-append (car x)) (fringe-append (cdr x))))
        (else (list x))))
; 1. If the element is null, return nil
; 2. If x is a pair, append fringe of car to fringe of cdr
; 3. Else (x is an atom) return x in the form of a list (that makes it work with append)
;
; This is what I was looking for. Simple, clear, concise, formulaic, and invincible.
; No matter the depth of the list, it will work.
;
; My biggest problem when first approaching this problem, was what to do with nil.
; I wrote a procedure that returned all the leaves, just with and empty list marking
; the end of every list. It wasn't making any sense.
; This procedure would append fringe of the car to fringe of the cdr. If the cdr was
; null, it would return nil.
; Upon examining append, one sees that (append (list 1 2) nil) will return (1 2)
; This is because append conses the elements of list 1 to each other, until it reaches
; the end of list 1, without adding nil element at the end of list 1. list 2 already has that.
; Append finishes by consing list 1 to list 2, returning the appended list.
; That is why returning nil on append works so well. 
;
; However, there was one hangup. I knew - I knew - that the procedure called for a consing
; through the list. All this list and append, worked, and the append definitely made it
; seem a fair choice, but I had this gnawing feeling that cons should be the right approach.
; When you hit a leaf, cons it to the result, right!
;
; Additionally, seeing VladimirF's comment (both on schemewiki and BilltheWizard.com
; that using cons worked better on large lists. So I made a test with very large lists.

(define l3 (list (create-list 100000) (list (create-list 10000) (create-list 1000)) (create-list 3000)))

(for-each (lambda (l) (display (fringe-append l)) (newline))
          (list l3))
; It worked, but I saw the lag. I could only imagine the efforts of having to append ever-growing lists to one
; another, recursively.
; So, I looked for a cons solution and here's what I found.
(define (fringe-cons items)  
  (define (fringe-iter items result) 
    (cond ((null? items) result) 
          ((pair? items) (fringe-iter (car items) (fringe-iter (cdr items) result))) 
          (else (cons items result)))) 
  (fringe-iter items nil))
; Again, that clarity and conciseness was there. The solution here uses an auxiliary function.
; 1. If items is null, return result.
; 2. If items is a pair, fringe the car of items (move left) while fringing the cdr (move right)
;    as the result. That means that as we move along in the list, we are building up the result
;    list from the right-most leaf (scheme evauluates inside-out) and end up consing the left-most
;    leaf to that result
; 3. Item is a leaf, cons to result.
;
; Thus, I have learned a lot, and have yet much to digest on this topic.
;
; The performance of this procedure is the best. I would say is O(n), while the append-list procedure is O(n^n).
; Without thinking too much about it.
;
; Warning: select what you want to see, otherwise, it's overwhelming, and might blow your stack. 
(for-each (lambda (l)
            (display l)
            (display (fringe-original l)) (newline)
            (display (fringe-append l)) (newline)
            (display (fringe-cons l)) (newline)
            (newline)
            (newline))
          (list l1 l2 l3))
