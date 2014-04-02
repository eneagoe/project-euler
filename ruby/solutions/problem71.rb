$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=71
class Problem71 < Problem
  def solve
    d, a, b = 1_000_000, 2, 5

    loop do
      b += 7
      break a if b > d
      a += 3
    end
  end
end

puts Problem71.solution if $PROGRAM_NAME == __FILE__
