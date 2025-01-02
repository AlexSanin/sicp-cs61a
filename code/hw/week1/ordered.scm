;;4. Write a predicate ordered? that takes a sentence of numbers as its argument and
;;returns a true value if the numbers are in ascending order, or a false value otherwise.

(define (ordered? numbers)
  (cond 
    ((null? numbers) #t)
    ((null? (cdr numbers)) #t)
    ((> (car numbers) (cadr numbers)) #f)
    (else (ordered? (cdr numbers)))))
