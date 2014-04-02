def pentagonal?(x)
  return false if x <= 0
  n = (1 + Math.sqrt(24 * x + 1)) / 6.0
  n % 1 == 0
end

def pentagonal(n)
  n * (3 * n - 1) / 2
end
