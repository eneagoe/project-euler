(defn fibonacci [fib]
  (list (second fib) (+ (first fib) (second fib))
    (if (even? (+ (first fib) (second fib))) (+ (last fib) (first fib) (second fib)) (last fib))
  )
)

(defn fibsum [x]
  (if (>= (second x) 4000000)
    (last x)
    (fibsum (fibonacci x))
  )
)

(fibsum '(1 2 2))
