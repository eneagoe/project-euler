$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "set"

# Solves http://projecteuler.net/problem=29
class Problem
  def self.solution_1
    n, seq = 100, Set.new

    (2..n).each do |a|
      (2..n).each { |b| seq << a**b }
    end

    seq.size
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
