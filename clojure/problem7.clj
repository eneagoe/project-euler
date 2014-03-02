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
  (if (and (prime? n) (= cnt 10001))
    n
    (recur (+ 2 n) (if (prime? n) (inc cnt) cnt))
  )
)