;;Write a procedure squares that takes a sentence of numbers as its argument and
;;returns a sentence of the squares of the numbers:
;;> (squares ’(2 3 4 5))
;;(4 9 16 25)

(define (square x) (* x x))

(define (squares numbers)
  (if (null? numbers)
    '();If empty, return empty list
      (cons;If not empty, use cons to construct new list
        (square (car numbers)); Square the first number in the list
        (squares (cdr numbers)))); Recursively process the rest of the list
) 

