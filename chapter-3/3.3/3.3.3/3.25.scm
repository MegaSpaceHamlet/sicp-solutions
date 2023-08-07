#lang sicp
; multi-dimensional tables

(define (make-table) (list '*table*))

(define (lookup keys table)
  (let ((record (assoc (car keys) (cdr table))))
    (if record
        (if (null? (cdr keys))
             (cdr record)
            (lookup (cdr keys) record))
        false)))

(define (insert! keys value table)
  (let ((record (assoc (car keys) (cdr table))))
    (if record
        (if (null? (cdr keys))
            (set-cdr! record value)
            (insert! (cdr keys) value record))
        (if (null? (cdr keys))
            (set-cdr! table
                      (cons
                       (cons (car keys) value)
                       (cdr table)))
            (let ((new-table (list (car keys))))
              (set-cdr! table
                        (cons
                         new-table
                         (cdr table)))
              (insert! (cdr keys) value new-table))))))
        

(#%provide (all-defined))
         
        
