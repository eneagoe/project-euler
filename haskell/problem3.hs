largestFactor n f
  | n == f = n
  | n `mod` f == 0 = largestFactor (n `div` f) f
  | otherwise = largestFactor n (f + 1)

solution = largestFactor 600851475143 2
