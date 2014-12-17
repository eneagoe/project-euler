toDigits n
  | n < 10 = [n]
  | otherwise = toDigits x ++ [y]
                where (x, y) = n `divMod` 10

fibs = 1:1:[a + b | (a, b) <- zip fibs (tail fibs)]

solution = head [i | (f, i) <- zip fibs [1..], length (toDigits f) >= 1000]
