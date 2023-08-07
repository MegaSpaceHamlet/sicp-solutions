#lang sicp
(#%provide (all-defined))

(define (make-table same-key?)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
            ((same-key? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    
    (define (lookup k)
      (let ((record (assoc k (cdr local-table))))
        (if record
            (cdr record)
            false)))

    (define (insert! k v)
      (let ((record (assoc k (cdr local-table))))
        (if record
            (set-cdr! record v)
            (set-cdr! local-table
                      (cons (cons k v)
                            (cdr local-table)))))
      'ok)

    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "BAD OP for table" m))))

    dispatch))
