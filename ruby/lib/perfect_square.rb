# in base 16 squares end in 0, 1, 4 or 9
def perfect_square?(n)

  return false if n == 0

  h = n & 0xf
  return false if h > 9
  if h != 2 && h != 3 && h != 5 && h!= 6 && h != 7 && h != 8
    sqrt = n ** 0.5
    return sqrt % 1 == 0
  end

  return false

end
