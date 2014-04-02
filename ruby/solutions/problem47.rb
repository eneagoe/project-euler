$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=47
class Problem47 < Problem
  def solve
    n = 1
    while [n, n + 1, n + 2, n + 3].
      map { |i| i.prime_division.size } != [4, 4, 4, 4]
      n += 1
    end
    n
  end
end

puts Problem47.solution if $PROGRAM_NAME == __FILE__
