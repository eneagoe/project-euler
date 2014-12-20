toDigits n
  | n < 10 = [n]
  | otherwise = toDigits x ++ [y]
  where (x, y) = n `divMod` 10

factorialSum n = sum $ map (\x -> product [1..x]) $ toDigits n

solution = sum $ filter (\n -> n == factorialSum n) [3..999999]
