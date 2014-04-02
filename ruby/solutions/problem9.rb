$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=9
class Problem9 < Problem
  def solve
    (3..1000 / 3).each do |a|
      (a + 1..(1000 - a) / 2).each do |b|
        c = 1000 - a - b
        return a * b * c if a**2 + b**2 == c**2
      end
    end
  end
end

puts Problem9.solution if $PROGRAM_NAME == __FILE__
