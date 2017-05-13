$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "bigdecimal"
require "bigdecimal/math"

# Solves http://projecteuler.net/problem=80
class Problem
  def self.solution_1
    (1..100).reduce(0) do |a, e|
      if (Math.sqrt(e) % 1).zero?
        a
      else
        root = BigMath.sqrt(BigDecimal.new(e.to_s), 100)
        # the first digit is 0, followed by a decimal dot
        root_sum = root.to_s[2, 100].split(//).map(&:to_i).reduce(:+)
        a + root_sum
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
