$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=7
class Problem7 < Problem
  def solve
    Prime.take(10_001).last
  end
end

puts Problem7.solution if $PROGRAM_NAME == __FILE__
