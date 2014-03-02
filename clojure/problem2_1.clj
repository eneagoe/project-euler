(defn fibsum [x]
  (if (>= (second x) 4000000)
    (last x)
    (recur (#(list (second %) (+ (first %) (second %)) (if (even? (+ (first %) (second %))) (+ (last %) (first %) (second %)) (last %))) x))
  )
)

(fibsum '(1 2 2))
