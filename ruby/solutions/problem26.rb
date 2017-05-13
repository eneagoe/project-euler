$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "divisors"

# Solves http://projecteuler.net/problem=26
class Problem
  # There is no general formula to find the period of a reciprocal 1/p,
  # apart from checking whether the prime p divides some number 99...9
  # whose number of digits is a divisor of (p-1).
  class << self
    def solution_1
      primes = Prime.take_while { |p| p < 1000 }.map do |p|
        [p, repeating_decimal_length(p)]
      end
      primes.max_by { |r| r[1] }[0]
    end

    def repeating_decimal_length(n)
      (divisors(n - 1) + [n - 1]).detect { |d| ((10**d - 1) % n).zero? } || 0
    end
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
