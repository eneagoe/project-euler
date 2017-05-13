$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "memoist"

# Solves http://projecteuler.net/problem=72
class Problem
  class << self
    extend Memoist

    def solution_1
      phi(1_000_000) - 2
    end

    def phi(n)
      n * (n + 3) / 2 - (2..n).reduce(0) { |a, e| a + phi(n / e) }
    end
    memoize :phi
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
