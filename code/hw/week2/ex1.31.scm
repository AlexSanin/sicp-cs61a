;Exercise 1.31:

;The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.
;Write an analogous procedure called product that returns the product of the values of a function at points over a given range. 
;Show how to define factorial in terms of product. Also use product to compute approximations to π using the formula
;π/4=(2⋅4⋅4⋅6⋅6⋅8)/(3⋅5⋅5⋅7⋅7)
;If your product procedure generates a recursive process, write one that generates an iterative process.
;If it generates an iterative process, write one that generates a recursive process.

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

(define (pi-prod a b)
  (define (pi-term x)
    (if (even? x)
        (/ (+ 2.0 (* 2 (quotient x 2)))    ; numerator: 2,4,4,6,6,8,...
           (+ 3.0 (* 2 (quotient (- x 1) 2)))) ; denominator: 3,3,5,5,7,7,...
        (/ (+ 2.0 (* 2 (quotient (- x 1) 2)))  ; numerator: 2,4,4,6,6,8,...
           (+ 3.0 (* 2 (quotient (- x 1) 2))))) ; denominator: 3,3,5,5,7,7,...
  )
  (define (pi-next x)
    (+ x 1)
  )
  (product-iter pi-term a pi-next b)
)
;pi = 3.14159265359
