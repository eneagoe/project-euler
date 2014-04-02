$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "pentagonal"

# Solver for http://projecteuler.net/problem=44
# brute-force, ugly
class Problem44 < Problem
  def solve
    j, solution = 1, 0

    loop do
      pj = pentagonal(j)
      (1..j).each do |k|
        pk = pentagonal(k)
        if pentagonal?(pj - pk) && pentagonal?(pj + pk)
          (solution = pj - pk) && break
        end
      end

      return solution if solution != 0
      j += 1
    end

    solution
  end
end

puts Problem44.solution if $PROGRAM_NAME == __FILE__
