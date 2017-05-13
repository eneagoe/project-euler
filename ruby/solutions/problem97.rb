$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=97
class Problem
  def self.solution_1
    prime, n = 28_433, 7_830_457
    prime = (prime << 1) % 10_000_000_000 while (n -= 1) >= 0
    prime + 1
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
