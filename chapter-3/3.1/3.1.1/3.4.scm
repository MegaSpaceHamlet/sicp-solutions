#lang sicp

(define (make-account initial password)
  (let ((balance initial)
        (consecutive-attempts 0))
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

    (define (call-the-cops)
      "COPS: You've been caught!")

    (define (dispatch p m)
      (if (verify p)
          (begin
            (set! consecutive-attempts 0)
            (cond ((eq? m 'withdraw) withdraw)
                  ((eq? m 'deposit) deposit)
                  (else (error "Bad op MAKE-ACCOUNT -- " m))))
          ; have to return a function, b/c of the way it's called
          (lambda (x)
            (begin (set! consecutive-attempts (+ consecutive-attempts 1))
                   (if (>= consecutive-attempts 7)
                       (call-the-cops)
                       "Incorrect password")))))
    dispatch))

(define acc (make-account 100 'password))

((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
((acc 'wrong-password 'withdraw) 40)
; 6 times
((acc 'password 'withdraw) 40)

((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
((acc 'wrong-password 'deposit) 60)
; 7 times