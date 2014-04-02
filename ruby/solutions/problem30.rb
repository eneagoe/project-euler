$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=30
class Problem30 < Problem
  attr_reader :powers

  def solve
    @powers = (0..9).map { |i| i**5 }
    (2..354_294).reduce(0) do |a, e|
      a + (e == sum_of_powers(e) ? e : 0)
    end
  end

  def sum_of_powers(n)
    n.to_s.split(//).reduce(0) { |a, e| a + powers[e.to_i] }
  end
end

puts Problem30.solution if $PROGRAM_NAME == __FILE__
