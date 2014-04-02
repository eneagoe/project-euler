def rotations(n)
  size = Math.log10(n).to_i
  (0..size).map do |i|
    n = (n % 10) * 10**size + n / 10
  end
end
