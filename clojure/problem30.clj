(defn digitalize [x]
  (loop [n x digits ()]
    (if (zero? n)
      digits
      (recur (bigint (/ n 10)) (conj digits (mod n 10)))
    )
  )
)

(loop [n 2 sum 0]
  (if (> n 999999)
    sum
    (recur (inc n) (if (= n (reduce + (map #(Math/pow % 5) (digitalize n)))) (+ sum n) sum))
  )
)