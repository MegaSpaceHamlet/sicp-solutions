#lang sicp
(#%require "../../../list-functions.rkt")
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position row col rest)
  (cons (cons row col) rest))

(define (row q)
  (car q))

(define (col q)
  (cdr q))

; if rest is null, return true
; if rest is not null, filter them for any that are same row,
; or row +- col-distance
(define (safe? queen-col positions)
  (let ((queen-row (row (car positions))))
    (define (test position)
      (let ((col-difference (- queen-col (col position)))
            (position-row (row position)))
        (or
         (= position-row queen-row)
         (= position-row (+ queen-row col-difference))
         (= position-row (- queen-row col-difference)))))
    (null? (filter test (cdr positions)))))

(define (print-boards board-size)
  (define (print-vertical-border)
    (for-each (lambda (col) (display "-"))
              (enumerate-interval 1 (+ 1 (* 2 board-size))))
    (newline))
  (let ((boards (queens board-size)))
    (display board-size)
    (cond ((= (length boards) 0) (display " - No boards") (newline))
          (else
           (newline)
           (for-each (lambda (board)
                       (print-vertical-border)
                       (for-each (lambda (row)
                                   (display "|")
                                   (for-each (lambda (cell)
                                               (display
                                                (if (in? (cons row cell) board)
                                                    "q"
                                                    " "))
                                               (display "|"))
                                             (enumerate-interval 1 board-size))
                                   (newline))
                                 (enumerate-interval 1 board-size))
                       (print-vertical-border))
                     boards)))))

(for-each (lambda (size)
            (print-boards size)
            (newline))
          (enumerate-interval 1 8))