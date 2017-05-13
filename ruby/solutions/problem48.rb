$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=48
class Problem
  def self.solution_1
    (1..1000).reduce(0) { |a, e| a + e**e } % 10_000_000_000
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
