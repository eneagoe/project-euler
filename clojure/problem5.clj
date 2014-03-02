(defn gcd [a, b]
  (if (and (= 0 b) (not (= 0 a)))
    a
  (gcd b (mod a b)))
)

(reduce
  #(
    if (zero? (mod % %2))
    %
    (* %
      (if (= 1 (gcd % %2))
        %2
        (gcd % %2)
      )
    )
  )
  1 (range 2 21)
)