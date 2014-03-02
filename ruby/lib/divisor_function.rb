require 'prime'

# http://en.wikipedia.org/wiki/Divisor_function
def count_divisors(n)
  Prime.prime_division(n).map { |s| s[1] + 1 }.reduce(:*) || 1
end
