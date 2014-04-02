$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=24
class Problem24 < Problem
  def solve
    (0..9).to_a.permutation.to_a[999_999].join
  end
end

puts Problem24.solution if $PROGRAM_NAME == __FILE__
