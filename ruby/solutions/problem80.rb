$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "bigdecimal"
require "bigdecimal/math"

# Solver for http://projecteuler.net/problem=80
class Problem80 < Problem
  include BigMath
  def solve
    (1..100).reduce(0) do |a, e|
      if Math.sqrt(e) % 1 == 0
        a
      else
        root = sqrt(BigDecimal.new(e.to_s), 100)
        # the first digit is 0, followed by a decimal dot
        root_sum = root.to_s[2, 100].split(//).map(&:to_i).reduce(:+)
        a + root_sum
      end
    end
  end
end

puts Problem80.solution if $PROGRAM_NAME == __FILE__
