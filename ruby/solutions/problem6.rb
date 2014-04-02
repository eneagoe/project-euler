$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=6
class Problem6 < Problem
  def solve
    n = 100
    # brute-force solution would be:
    # (1..n).reduce(:+)**2 - (1..n).reduce { |s,i| s += i*i }
    # ... but the mathematical solution is faster
    (n * (n + 1) / 2)**2 - n * (n + 1) * (2 * n + 1) / 6
  end
end

puts Problem6.solution if $PROGRAM_NAME == __FILE__
