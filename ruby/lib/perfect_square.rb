# in base 16 squares end in 0, 1, 4 or 9
def perfect_square?(n)
  return false if n == 0

  h = n & 0xf
  return false if h > 9
  unless [2, 3, 5, 6, 7, 8].include?(h)
    sqrt = n**0.5
    return sqrt % 1 == 0
  end

  false
end
