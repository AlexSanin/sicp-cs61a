(define (f x) (f x))

;if we pass x more than 0, we will return x and it means that Lisp has OR as special procedure because we evaluate only needed branch
(define (check-or x)
  (cond 
    ((or (> x 0) (< x (f x))) x)
    (else (+ x 5))))

;if we pass 1 as x, we will get infinity loop because we will evaluate f(x) and it  means that either OR or AND isn't a special form
(define (check-and x)
  (cond 
    ((and (or (> x 0) (< x (f x))) (or (> x 2) (< x (f x)))) x)
    (else (+ x 5))))
    
;solution below much simplier than my)
(or #t (f 1))  ; If special form: returns #t
               ; If regular function: infinite recursion
(and #f (f 1)) ; If special form: returns #f
               ; If regular function: infinite recursion
; Test if OR is a special form
(define (check-or x)
  (or #t (f x)))  ; If OR is a special form, returns #t
                  ; If regular function, infinite recursion

; Test if AND is a special form  
(define (check-and x)
  (and #f (f x))) ; If AND is a special form, returns #f
                  ; If regular function, infinite recursion    
