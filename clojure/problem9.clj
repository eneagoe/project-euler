(for [
  x (range 3 (int (/ 1000 3)))
  y (range 1 999)
  :when (and (< x y) (= (* (- 1000 (+ x y)) (- 1000 (+ x y))) (+ (* x x) (* y y))))] (* x y (- 1000 (+ x y)))
)
