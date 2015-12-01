$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=100
# the problems reduces to finding solutions to Pell's equation:
# 8r^2 + 1 = k^2. Use WolframAlpha to determine possible solution forms, then
# we loop through the first solution (they grow quickly), and pick the first
# one bigger than 10^12
class Problem100 < Problem
  def solve
    c = 2 * Math.sqrt(2)
    limit = 10**12
    (1..20).each do |n|
      r = ((3 + c)**n - (3 - c)**n) / (2 * c)
      b = (2 * r + 1 + Math.sqrt(8 * r**2 + 1)) / 2
      break b.round if b + r > limit
    end
  end
end

puts Problem100.solution if $PROGRAM_NAME == __FILE__
