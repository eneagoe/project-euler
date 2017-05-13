$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "digits"

# Solves http://projecteuler.net/problem=56
class Problem
  def self.solution_1
    (1..100).map { |a| (1..100).map { |b| digits(a**b).reduce(:+) }.max }.max
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
