$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "pandigital"

# Solves http://projecteuler.net/problem=104
class Problem
  # brute-force, extremely slow
  def self.solution_1
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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
