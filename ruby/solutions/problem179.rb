$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "divisor_function"

# Solver for http://projecteuler.net/problem=179
# brute-force, it takes about 7 min.
class Problem179 < Problem
  def solve
    limit = 10_000_000
    sigmas = (1..limit).map { |n| count_divisors(n) }
    sigmas.each_with_index.count { |n, i| n == sigmas[i + 1] }
  end
end

puts Problem179.solution if $PROGRAM_NAME == __FILE__
