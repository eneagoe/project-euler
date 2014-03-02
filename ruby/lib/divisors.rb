def divisors(n)

  res = [1]

  2.upto(Math.sqrt(n).floor) do |i|
    if n % i == 0
      res << i
    end
  end

  res.reverse.each do |i|
    res << n / i
  end

  res.uniq - [n]

end

def perfect?(n)
  divisors(n).reduce(:+) == n
end

def abundant?(n)
  divisors(n).reduce(:+) > n
end
