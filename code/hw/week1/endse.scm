(define (ends-with? word char)
  (let ((chars (string->list (symbol->string word))))
    (and (not (null? chars)) (char=? (car (reverse chars)) char))
  )
)

(define (ends-e sentence)
  (filter (lambda (word) (ends-with? word #\e)) sentence)
)
