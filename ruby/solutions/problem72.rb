$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "memoize"

include Memoize

# Solver for http://projecteuler.net/problem=72
class Problem72 < Problem
  def solve
    memoize :phi
    phi(1_000_000) - 2
  end

  def phi(n)
    n * (n + 3) / 2 - (2..n).reduce(0) { |a, e| a + phi(n / e) }
  end
end

puts Problem72.solution if $PROGRAM_NAME == __FILE__
