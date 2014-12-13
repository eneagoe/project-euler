toDigits n
  | n < 10 = [n]
  | otherwise = toDigits x ++ [y]
                  where (x, y) = n `divMod` 10

solution = sum $ toDigits (2^1000)
