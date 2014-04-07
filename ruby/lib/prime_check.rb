def prime?(n)
  if n < 4
    true
  elsif n.even?
    false
  elsif n < 9
    true
  elsif n % 3 == 0
    false
  else
    large_prime?(n)
  end
end

def large_prime?(n)
  r = Math.sqrt(n)
  i = 5
  while i <= r
    return false if n % i == 0 || n % (i + 2) == 0
    i += 4
  end
  true
end

require "openssl"
# rubocop:disable MethodLength, CyclomaticComplexity
def miller_rabin_prime?(n, g)
  d = n - 1
  s = 0
  while d.even?
    d /= 2
    s += 1
  end
  g.times do
    a = 2 + rand(n - 4)
    x = OpenSSL::BN.new(a.to_s).mod_exp(d, n)
    next if x == 1 || x == n - 1
    (1..s - 1).each do
      x = x.mod_exp(2, n)
      return false if x == 1
      break if x == n - 1
    end
    return false if x != n - 1
  end
  true
end
