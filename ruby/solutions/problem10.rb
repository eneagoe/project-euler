$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=10
class Problem10 < Problem
  def solve
    sum = 0
    Prime.each { |i| break sum if i > 2_000_000; sum += i }
    # a slightly slower but more readable solution would be
    # Prime.take_while { |i| i < 2000000 }.reduce(:+)
  end
end

puts Problem10.solution if $PROGRAM_NAME == __FILE__
