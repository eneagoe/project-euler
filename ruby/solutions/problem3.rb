$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=3
class Problem3 < Problem
  def solve
    n, f = 600_851_475_143, 2
    n % f == 0 ? n /= f : f += 1 while n != f
    n
  end
end

puts Problem3.solution if $PROGRAM_NAME == __FILE__
