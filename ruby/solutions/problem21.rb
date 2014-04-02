$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "divisors"

# Solver for http://projecteuler.net/problem=21
class Problem21 < Problem
  def solve
    amicable = []
    (2..10_000).each do |i|
      a = divisors_sum(i)
      b = divisors_sum(a)
      amicable += [i, a] if b == i && a != i
    end

    amicable.uniq.reduce(:+)
  end

  def divisors_sum(n)
    divisors(n).reduce(:+)
  end
end

puts Problem21.solution if $PROGRAM_NAME == __FILE__
