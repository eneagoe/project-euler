$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=6
class Problem
  # brute-force solution
  def self.solution_1
    n = 100
    (1..n).reduce(:+)**2 - (1..n).reduce { |s, i| s + i * i }
  end

  # ... but the mathematical solution is faster
  def self.solution_2
    n = 100
    (n * (n + 1) / 2)**2 - n * (n + 1) * (2 * n + 1) / 6
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
