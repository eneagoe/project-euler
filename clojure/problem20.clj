;(def factorial
;  (fn [n]
;    (loop [cnt n acc 1]
;       (if (zero? cnt)
;            acc
;          (recur (dec cnt) (* acc cnt))))))

;(defn fact [n]
;  (reduce * (range 1 (inc n))))

(loop [n (#(reduce * (range 1 (inc %))) 100) sum 0]
  (if (zero? n)
    sum
    (recur (bigint (/ n 10)) (+ sum (mod n 10)))
  )
)