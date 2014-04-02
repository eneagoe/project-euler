$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "bouncy"

# brute-force
# Solver for http://projecteuler.net/problem=112
class Problem112 < Problem
  def solve
    bouncies, i = 0, 1
    loop do
      bouncies += 1 if bouncy?(i)
      break i if bouncies / i.to_f == 0.99
      i += 1
    end
  end
end

puts Problem112.solution if $PROGRAM_NAME == __FILE__
