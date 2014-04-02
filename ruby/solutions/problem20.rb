$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=20
class Problem20 < Problem
  def solve
    sum, n = 0, (1..100).reduce(:*)
    sum, n = sum + n % 10, n / 10 while n != 0
    sum
  end
end

puts Problem20.solution if $PROGRAM_NAME == __FILE__
