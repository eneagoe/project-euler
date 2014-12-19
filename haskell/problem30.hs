toDigits n
  | n < 10 = [n]
  | otherwise = toDigits x ++ [y]
  where (x, y) = n `divMod` 10

fifthPowSum n = sum (map (^5) (toDigits n))

solution = sum [n | n <- [2..354294], n == fifthPowSum n]
