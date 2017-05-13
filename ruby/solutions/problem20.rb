$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=20
class Problem
  def self.solution_1
    sum, n = 0, (1..100).reduce(:*)
    sum, n = sum + n % 10, n / 10 while n != 0
    sum
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
