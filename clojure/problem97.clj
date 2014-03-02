(loop [cnt 1 prime 28433]
  (if (> cnt 7830457)
  (inc prime)
  (recur (inc cnt) (mod (bit-shift-left prime 1) 10000000000))
  )
)

