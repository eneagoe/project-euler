$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "divisors"

# Solves http://projecteuler.net/problem=23
class Problem
  def self.solution_1
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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
