$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "digits"

# Solves http://projecteuler.net/problem=62
class Problem
  def self.solution_1
    cubes = (1..10_000).map { |i| i**3 }
    cube_digits = cubes.map { |i| sorted_digits(i).join }
    counts = cube_digits.map { |d| cube_digits.count(d) }

    cubes[counts.find_index(5)]
  end
end

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
