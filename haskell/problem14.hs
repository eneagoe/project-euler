collatz acc n
  | n == 1 = acc
  | even n = collatz (acc + 1) (n `div` 2)
  | otherwise = collatz (acc + 1) (3 * n + 1)

maxcollatz crt n = if (fst crt) > m then crt else (m, n)
                     where m = collatz 1 n

solution = foldl (\acc x -> maxcollatz acc x) (1, 1) [1..1000000]
