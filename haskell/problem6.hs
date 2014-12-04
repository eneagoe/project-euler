sumSquares n = n * (n + 1) * (2 * n + 1) `div` 6
squareSum n = (n * (n + 1) `div` 2) ^ 2

solution = squareSum 100 - sumSquares 100
