$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=1
class Problem1 < Problem
  def solve
    (0...1000).select { |i| i % 3 == 0 || i % 5 == 0 }.reduce(:+)
  end
end

puts Problem1.solution if $PROGRAM_NAME == __FILE__
