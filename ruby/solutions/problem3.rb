$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=3
class Problem
  def self.solution_1
    n, f = 600_851_475_143, 2
    (n % f).zero? ? n /= f : f += 1 while n != f
    n
  end

  def self.solution_2
    # transpose will "unzip" the divisors array, and since they are
    # already sorted, we just take the last one
    Prime.prime_division(600_851_475_143).transpose.first.last
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
