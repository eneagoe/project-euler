$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=57
class Problem57 < Problem
  def solve
    numerator, denominator = 1, 1

    (0..1000).count do
      c = denominator
      denominator = numerator + denominator
      numerator = denominator + c

      numerator.to_s.length > denominator.to_s.length
    end
  end
end

puts Problem57.solution if $PROGRAM_NAME == __FILE__
