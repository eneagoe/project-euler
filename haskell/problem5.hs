fn a e
  | a `mod` e == 0 = a
  | otherwise = a * if p /= 1 then p else e where p = gcd a e
solution = foldl fn 1 [2..20]
