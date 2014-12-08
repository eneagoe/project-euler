toDigits n
  | n < 10 = [n]
  | otherwise = toDigits x ++ [y]
  where (x, y) = n `divMod` 10

reverseInt = foldl (\ x v -> x*10 + v) 0 . reverse . toDigits

isPalindrome i = i - reverseInt i == 0

solution = maximum [i*j | i <- [999,998..101], j <- [990,979..101], isPalindrome (i * j)]
