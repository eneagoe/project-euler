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

(loop [n 3 cnt 2]
  (let [is_prime? (prime? n)]
    (if (and is_prime? (= cnt 10001))
      n
      (recur (+ 2 n) (if is_prime? (inc cnt) cnt))
    )
  )
)