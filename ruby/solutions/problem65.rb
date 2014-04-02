$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "digits"

# Solver for http://projecteuler.net/problem=65
class Problem65 < Problem
  def solve
    n = 100
    prev, current = 1, 2

    (2..n).each do |i|
      a = (i % 3 == 0) ? 2 * i / 3 : 1
      current, prev = prev + a * current, current
    end

    digits(current).reduce(:+)
  end
end

puts Problem65.solution if $PROGRAM_NAME == __FILE__
