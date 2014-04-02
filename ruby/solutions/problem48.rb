$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=48
class Problem48 < Problem
  def solve
    (1..1000).reduce(0) { |a, e| a + e**e } % 10_000_000_000
  end
end

puts Problem48.solution if $PROGRAM_NAME == __FILE__
