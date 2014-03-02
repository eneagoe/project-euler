; far too slow
;(defn divisors_count [n]
;  (reduce + 1 (map #(if (= 0 (mod n %)) 1 0) (range 1 (inc (int (/ n 2))))))
;)

; faster, but slower than Uncle Bob's version
(defn prime-factors [i]
  (loop [n i factors () divisor 2]
    (if (> n 1)
      (if (zero? (mod n divisor))
        (recur (/ n divisor) (conj factors divisor) divisor)
        (recur n factors (inc divisor))
      )
      factors
    )
  )
)

; Uncle Bob's version
;(ns primeFactors)
;
;(defn of
;  ([n] (of [] n 2))
;  ([factors n candidate]
;    (cond
;      (= n 1) factors
;      (= 0 (rem n candidate)) (recur (conj factors candidate) (quot n candidate) candidate)
;      (> candidate (Math/sqrt n)) (conj factors n)
;      :else (recur factors n (inc candidate))
;    )
;  )
;)

(defn count-divisors [n]
  (reduce #(* % (inc (last %2))) 1 (apply merge-with + (for [x (prime-factors n)] {x 1})))
)

;(ns main)
(loop [i 28]
  (let [n (/ (* i (inc i)) 2)]
    (if (>= (count-divisors n) 500)
      n
      (recur (inc i))
    )
  )
)