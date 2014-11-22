fibs = 1:1:[a + b | (a, b) <- zip fibs (tail fibs)]
solution = sum [x | x <- takeWhile (<= 4000000) fibs, even x]
