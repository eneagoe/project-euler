def reverse(n)
  r = 0
  r, n = (r*10 + n % 10), n / 10 while n != 0
  r
end

def palindrome?(n)
  n - reverse(n) == 0
end
