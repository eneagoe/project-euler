$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=47
class Problem
  def self.solution_1
    n = 1
    while [n, n + 1, n + 2, n + 3].
          map { |i| i.prime_division.size } != [4, 4, 4, 4]
      n += 1
    end
    n
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
