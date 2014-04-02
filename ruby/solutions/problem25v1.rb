$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=25
class Problem25v1 < Problem
  def solve
    # using F(n) = [phi**n/sqrt(5)]
    ((1000 - 1 + Math.log10(Math.sqrt(5))) /
     Math.log10((1 + Math.sqrt(5)) / 2)).to_i + 1
  end
end

puts Problem25v1.solution if $PROGRAM_NAME == __FILE__
