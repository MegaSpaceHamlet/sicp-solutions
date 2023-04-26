#lang sicp
(#%provide make-account)

(define (make-account initial password)
  (let ((balance initial))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient Funds"))

    (define (deposit amount)
      (begin
        (set! balance (+ balance amount))
        balance))

    (define (verify attempted-password)
      (eq? attempted-password password))

    (define (dispatch p m)
      (if (verify p)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Bad op MAKE-ACCOUNT -- " m)))
          ; have to return a function, b/c of the way it's called
          (lambda (x) (display "Incorrect password") (newline))))
    dispatch))

(define acc (make-account 100 'password))

((acc 'wrong-password 'withdraw) 40)

((acc 'password 'withdraw) 40)

((acc 'wrong-password 'deposit) 60)

((acc 'password 'deposit) 60)