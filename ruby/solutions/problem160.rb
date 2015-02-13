$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=160
class Problem160 < Problem
  def solve
    # FIXME: brute-force doesn't really work
    n = 10**12
    (1..n).lazy.reduce(1) do |solution, i|
      solution *= i
      solution /= 10 while solution % 10 == 0
      solution % 10**5
    end
  end
end

puts Problem160.solution if $PROGRAM_NAME == __FILE__
