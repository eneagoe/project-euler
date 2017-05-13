$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "pentagonal"

# brute-force, ugly, within 1m limit
# Solves http://projecteuler.net/problem=44
class Problem
  def self.solution_1
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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
