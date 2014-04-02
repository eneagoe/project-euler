$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime_check"

# Solver for http://projecteuler.net/problem=10
class Problem10v1 < Problem
  def solve
    # slightly faster than using Ruby's prime generator
    (2..2_000_000).select { |i| prime?(i) }.reduce(:+)
  end
end

puts Problem10v1.solution if $PROGRAM_NAME == __FILE__
