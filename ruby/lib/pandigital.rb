def pandigital?(n)
  n.to_s.each_char.sort.join == (1..Math.log10(n).to_i+1).to_a.join
end
