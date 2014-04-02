$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "date"

# Solver for http://projecteuler.net/problem=19
class Problem19 < Problem
  def solve
    (1901..2000).reduce(0) { |a, e| a + months_sum(e) }
  end

  def months_sum(year)
    (1..12).reduce(0) { |a, e| a + (Date.new(year, e, 1).wday == 0 ? 1 : 0) }
  end
end

puts Problem19.solution if $PROGRAM_NAME == __FILE__
