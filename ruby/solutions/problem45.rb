$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "pentagonal"

# Solver for http://projecteuler.net/problem=45
class Problem45 < Problem
  def solve
    # use T(n) = P(m) = H(p) to derive the condition below ...
    # ... and start above the known m
    m = 166
    loop do
      break pentagonal(m) if (Math.sqrt(12 * m**2 - 4 * m + 1) + 1) % 4 == 0
      m += 1
    end
  end
end

puts Problem45.solution if $PROGRAM_NAME == __FILE__
