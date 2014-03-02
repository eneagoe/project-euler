$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'
require 'divisors'

class Problem26 < Problem

  # There is no general formula to find the period of a reciprocal 1/p,
  # apart from checking whether the prime p divides some number 99...9
  # whose number of digits is a divisor of (p-1).
  def solve
    Prime.take_while { |p| p < 1000 }.map do |p|
      [p, repeating_decimal_length(p)]
    end.max_by { |r| r[1] }[0]
  end

  def repeating_decimal_length(n)
    (divisors(n-1) + [n - 1]).each do |d|
      return d if ((10**d - 1) % n == 0)
    end
    0
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem26.solution
end
