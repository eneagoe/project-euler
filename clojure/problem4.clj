; reverses a number
(defn rev-number [x]
  (loop [n x rev 0]
    (if (zero? n)
      rev
      (recur (int (/ n 10)) (+ (* 10 rev) (mod n 10)))
    )
  )
)

(loop [x 101 y 101 maxp 0]
  (if (= 1000 x)
    (if (= (inc y) 1000)
      maxp
      (recur 100 (inc y) (if (and (= (* x y) (rev-number (* x y))) (< maxp (* x y))) (* x y) maxp))
    )
    (recur (inc x) y (if (and (= (* x y) (rev-number (* x y))) (< maxp (* x y))) (* x y) maxp))
  )
)