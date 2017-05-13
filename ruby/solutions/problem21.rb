$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "divisors"

# Solves http://projecteuler.net/problem=21
class Problem
  def self.solution_1
    amicable = []
    (2..10_000).each do |i|
      a = divisors_sum(i)
      b = divisors_sum(a)
      amicable += [i, a] if b == i && a != i
    end

    amicable.uniq.reduce(:+)
  end

  def self.divisors_sum(n)
    divisors(n).reduce(:+)
  end
end

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
