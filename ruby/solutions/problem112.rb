$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "bouncy"

# brute-force
# Solves http://projecteuler.net/problem=112
class Problem
  def self.solution_1
    bouncies, i = 0, 1
    loop do
      bouncies += 1 if bouncy?(i)
      break i if bouncies / i.to_f == 0.99
      i += 1
    end
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
