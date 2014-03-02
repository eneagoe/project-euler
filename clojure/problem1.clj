(defn valid? [n]
  (cond
    (= 0 (mod n 3)) true
    (= 0 (mod n 5)) true
    :default false
  )
)

(reduce + (filter valid? (range 1 1000)))