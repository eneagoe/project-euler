$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=41
class Problem41 < Problem
  def solve
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

puts Problem41.solution if $PROGRAM_NAME == __FILE__
