;(accumulate combiner null-value term a next b)
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
      )
    )
  (iter a null-value)
)

(define (accumulate-rec combiner null-value term a next b)
    (if (> a b)
      null-value 
      (combiner 
        (term a) 
        (accumulate-rec combiner null-value term (next a) next b)
      )
    )
)

;(define (sum term a next b)
;  (if (> a b)
;      0
;      (+ (term a)
;         (sum term (next a) next b))))


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
  (accumulate-rec * 1 pi-term a pi-next b)
)

