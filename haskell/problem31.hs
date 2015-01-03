countChange n coins
  | n == 0 = 1
  | n < 0  = 0
  | null coins && n >= 1 = 0
  | otherwise = (countChange n (init coins)) + (countChange (n - last coins) coins)

solution = countChange 200 [1, 2, 5, 10, 20, 50, 100, 200]
