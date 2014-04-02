$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "divisors"

# Solver for http://projecteuler.net/problem=23
class Problem23 < Problem
  def solve
    abundants = (12..28_123).select { |i| abundant?(i) }
    sums = []
    until abundants.empty?
      i = abundants.shift
      sums << i * 2
      abundants.each do |j|
        sum = i + j
        break if sum > 28_123
        sums << sum
      end
    end

    ((1..28_123).to_a - sums).reduce(:+)
  end
end

puts Problem23.solution if $PROGRAM_NAME == __FILE__
