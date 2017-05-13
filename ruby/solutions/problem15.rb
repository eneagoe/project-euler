$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=15
class Problem
  def self.solution_1
    # the answer is 40 choose 20
    n = (1..20).reduce(:*)
    (21..40).reduce(:*) / n
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
