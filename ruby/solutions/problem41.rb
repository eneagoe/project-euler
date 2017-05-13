$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=41
class Problem
  def self.solution_1
    solution = 0

    (4..7).each do |i|
      (1..i).to_a.permutation.each do |p|
        n = p.join.to_i
        solution = n if (solution < n) && n.prime?
      end
    end
    solution
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
