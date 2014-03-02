(defn prime? [n]
  (if (= 1 n)
    false
    (if (< n 4)
      true
      (if (= 0 (mod n 2))
        false
        (if (< n 9)
          true
          (if (= 0 (mod n 3))
            false
            (loop [r (int (Math/sqrt n)) i 5]
              (if (<= i r)
                (if (or (= 0 (mod n i)) (= 0 (mod n (+ 2 i))))
                  false
                (recur r (+ i 4)))
                true
              )
            )
          )
        )
      )
    )
  )
)

(reduce + 2 (filter prime? (range 1 2000000 2)))
