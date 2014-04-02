$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=97
class Problem97 < Problem
  def solve
    prime, n = 28_433, 7_830_457
    prime = (prime << 1) % 10_000_000_000 while (n -= 1) >= 0
    prime + 1
  end
end

puts Problem97.solution if $PROGRAM_NAME == __FILE__
