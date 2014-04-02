$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "gcd"

# Solver for http://projecteuler.net/problem=5
class Problem5 < Problem
  def solve
    (2..20).reduce do |a, e|
      (a % e == 0 && a) || (a * ((p = gcd(a, e)) != 1 && p || e))
    end
  end
end

puts Problem5.solution if $PROGRAM_NAME == __FILE__
