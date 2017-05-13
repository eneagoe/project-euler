$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=53
class Problem
  def self.solution_1
    fact = (1..100).map { |i| (1..i).reduce(:*) }

    (23..100).map do |n|
      (1..100).count do |k|
        fact[n - 1] / (fact[k - 1] * fact[n - k - 1]) >= 1_000_000
      end
    end.reduce(:+)
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
