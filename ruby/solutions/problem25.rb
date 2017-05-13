$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "fibonacci"

# Solves http://projecteuler.net/problem=25
class Problem
  def self.solution_1
    limit = 10**999
    Fibonacci.each_with_index { |fib, i| break i + 1 if fib >= limit }
  end

  def self.solution_2
    # using F(n) = [phi**n/sqrt(5)]
    ((1000 - 1 + Math.log10(Math.sqrt(5))) /
     Math.log10((1 + Math.sqrt(5)) / 2)).to_i + 1
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
