$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=63
class Problem63 < Problem
  def solve
    powers, n = 0, 1

    while (n * Math.log10(9)).to_i > n - 2
      powers += (1..9).count { |i| (n * Math.log10(i)).to_i + 1 == n }
      n += 1
    end

    powers
  end
end

puts Problem63.solution if $PROGRAM_NAME == __FILE__
