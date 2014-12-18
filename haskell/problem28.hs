diagonalSum n = n * n + (n - 1)^2 + 1 + n * n - n + 1 + n * n - 3 * n + 3
solution = 1 + sum [diagonalSum n | n <- [3..1001], odd n]
