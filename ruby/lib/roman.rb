ROMAN = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_i(s)
  last = s[-1]
  s.reverse.each_char.reduce(0) do |a, e|
    if ROMAN[e] < ROMAN[last]
      a - ROMAN[e]
    else
      last = e
      a + ROMAN[e]
    end
  end
end

def i_to_roman(n)
  return "" if n == 0
  ROMAN.each do |d, v|
    return d + i_to_roman(n - v) if n >= v
  end
end
