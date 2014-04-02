$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "digits"

# Solver for http://projecteuler.net/problem=56
class Problem56 < Problem
  def solve
    (1..100).map { |a| (1..100).map { |b| digits(a**b).reduce(:+) }.max }.max
  end
end

puts Problem56.solution if $PROGRAM_NAME == __FILE__
