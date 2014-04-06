$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "pandigital"

# Solver for http://projecteuler.net/problem=104
class Problem104 < Problem
  # brute-force, extremely slow
  def solve
    cut = 1_000_000_000
    idx, i, j = 0, 0, 1
    loop do
      i, j = j, i + j
      idx += 1
      next if idx < 500
      head = i.to_s[0..8].to_i
      tail = i % cut
      break idx if pandigital?(head) && pandigital?(tail)
    end
  end
end

puts Problem104.solution if $PROGRAM_NAME == __FILE__
