$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "pentagonal"

# Solves http://projecteuler.net/problem=45
class Problem
  def self.solution_1
    # use T(n) = P(m) = H(p) to derive the condition below ...
    # ... and start above the known m
    m = 166
    loop do
      break pentagonal(m) if ((Math.sqrt(12 * m**2 - 4 * m + 1) + 1) % 4).zero?
      m += 1
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
