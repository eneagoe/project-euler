$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "memoist"

# Solves http://projecteuler.net/problem=76
class Problem
  class << self
    extend Memoist

    def solution_1
      partition(100) - 1
    end

    # partition function using Euler's formula
    def partition(n)
      return 1 if n == 1 || n.zero?
      return 0 if n.negative?
      (1..n).map do |k|
        (-1)**(k + 1) * (partition(n - k * (3 * k - 1) / 2) +
                         partition(n - k * (3 * k + 1) / 2))
      end.reduce(:+)
    end
    memoize :partition
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
