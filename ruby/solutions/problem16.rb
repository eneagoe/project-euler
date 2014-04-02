$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=16
class Problem16 < Problem
  def solve
    (2**1000).to_s.enum_for(:each_char).reduce(0) { |a, e| a + e.to_i }
  end
end

puts Problem16.solution if $PROGRAM_NAME == __FILE__
