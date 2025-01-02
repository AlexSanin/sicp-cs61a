;;1. First, let's recall what we just learned about evaluation orders:
;;   - Regular procedures use applicative-order evaluation (evaluate all arguments first)
;;   - Special forms like `if` have their own evaluation rules (only evaluate the needed branch)
;;
;;2. Now let's analyze why `new-if` is different from regular `if`:
;;   ```scheme
;;   ;; With regular if:
;;   (if (good-enough? guess x)    ; First evaluates only the predicate
;;       guess                     ; Then evaluates only one of these
;;       (sqrt-iter (improve guess x) x))
;;
;;   ;; With new-if (a regular procedure):
;;   (new-if (good-enough? guess x)    ; Evaluates this first
;;           guess                     ; AND evaluates this
;;           (sqrt-iter (improve guess x) x))  ; AND evaluates this!
;;   ```
;;
;;3. The problem:
;;   - Because `new-if` is a regular procedure, it follows applicative-order evaluation
;;   - This means it evaluates ALL arguments before applying the procedure
;;   - Therefore, it always evaluates the recursive call `(sqrt-iter (improve guess x) x)`
;;   - This leads to infinite recursion, even when `good-enough?` returns true!
