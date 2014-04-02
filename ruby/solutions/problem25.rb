$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "fibonacci"

# Solver for http://projecteuler.net/problem=25
class Problem25 < Problem
  def solve
    limit = 10**999
    Fibonacci.each_with_index { |fib, i| break i + 1 if fib >= limit }
  end
end

puts Problem25.solution if $PROGRAM_NAME == __FILE__
