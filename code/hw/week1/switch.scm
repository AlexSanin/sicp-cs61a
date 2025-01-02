;;3. Write a procedure switch that takes a sentence as its argument and returns a sentence
;;in which every instance of the words I or me is replaced by you, while every instance of
;;you is replaced by me except at the beginning of the sentence, where it’s replaced by I.
;;(Don’t worry about capitalization of letters.) Example:
;;> (switch ’(You told me that I should wake you up))
;;(i told you that you should wake me up)

(define (switch sentence)
  (define (switch-word word first?)
    (cond ((or (eq? word 'I) (eq? word 'me)) 'you)
          ((or (eq? word 'You) (eq? word 'you)) (if first? 'i 'me))
          (else word)))

  (define (switch-words words first?)
    (if (null? words)
        '()
        (cons (switch-word (car words) first?)
              (switch-words (cdr words) #f))))

  (switch-words sentence #t))

;; Test cases
;;> (switch ’(You told me that I should wake you up))
;;(i told you that you should wake me up)
