$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "digits"

# Solves http://projecteuler.net/problem=65
class Problem
  def self.solution_1
    n = 100
    prev, current = 1, 2

    (2..n).each do |i|
      a = (i % 3).zero? ? 2 * i / 3 : 1
      current, prev = prev + a * current, current
    end

    digits(current).reduce(:+)
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
