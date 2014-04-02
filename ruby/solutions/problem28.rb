$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=28
class Problem28 < Problem
  def solve
    1 + (3..1001).map { |n| n.even? ? 0 : diagonal_sum(n) }.reduce(:+)
  end

  def diagonal_sum(n)
    n * n + (n - 1)**2 + 1 + n * n - n + 1 + n * n - 3 * n + 3
  end
end

puts Problem28.solution if $PROGRAM_NAME == __FILE__
