$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=28
class Problem
  class << self
    def solution_1
      1 + (3..1001).map { |n| n.even? ? 0 : diagonal_sum(n) }.reduce(:+)
    end

    def diagonal_sum(n)
      n * n + (n - 1)**2 + 1 + n * n - n + 1 + n * n - 3 * n + 3
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
