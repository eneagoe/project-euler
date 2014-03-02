def prime?(n)

  if n < 4
    true
  elsif n % 2 == 0
    false
  elsif n < 9
    true
  elsif n % 3 == 0
    false
  else
    r = Math.sqrt(n)
    i = 5
    while i <= r
      return false if n % i == 0 || n % (i + 2) == 0
      i += 4
    end
    true
  end

end
