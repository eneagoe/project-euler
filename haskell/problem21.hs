factors n = [x | x <- [1..n], n `mod` x == 0]
properDivisors = init . factors
amicable n = sum (properDivisors m) == n && m /= n
             where m = sum (properDivisors n)

solution = sum $ filter amicable [2..10000]
