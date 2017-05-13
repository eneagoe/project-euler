$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=160
class Problem
  def self.solution_1
    # FIXME: brute-force doesn't really work
    n = 10**12
    (1..n).lazy.reduce(1) do |solution, i|
      solution *= i
      solution /= 10 while (solution % 10).zero?
      solution % 10**5
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
