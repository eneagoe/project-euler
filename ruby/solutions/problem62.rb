$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "digits"

# Solver for http://projecteuler.net/problem=62
class Problem62 < Problem
  def solve
    cubes = (1..10_000).map { |i| i**3 }
    cube_digits = cubes.map { |i| sorted_digits(i).join }
    counts = cube_digits.map { |d| cube_digits.count(d) }

    cubes[counts.find_index(5)]
  end
end

puts Problem62.solution if $PROGRAM_NAME == __FILE__
