$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=15
class Problem15 < Problem
  def solve
    # the answer is 40 choose 20
    n = (1..20).reduce(:*)
    (21..40).reduce(:*) / n
  end
end

puts Problem15.solution if $PROGRAM_NAME == __FILE__
