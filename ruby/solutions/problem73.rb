$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=73
class Problem73 < Problem
  def solve
    d = 12_000

    (1..d - 1).map do |i|
      (i + 1..d).count do |n|
        r = i.to_f / n.to_f
        Rational(i, n).denominator >= n if 1 / 3.0 < r && 1 / 2.0 > r
      end
    end.reduce(:+)
  end
end

puts Problem73.solution if $PROGRAM_NAME == __FILE__
