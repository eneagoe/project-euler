$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "fibonacci"

# Solves http://projecteuler.net/problem=2
class Problem
  def self.solution_1
    n = 4_000_000
    Fibonacci.take_while { |i| i < n }.select(&:even?).reduce(:+)
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
