$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "divisor_function"

# Solves http://projecteuler.net/problem=179
# FIXME: brute-force, it takes about 7 min.
class Problem
  def self.solution_1
    limit = 10_000_000
    sigmas = (1..limit).map { |n| count_divisors(n) }
    sigmas.each_with_index.count { |n, i| n == sigmas[i + 1] }
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
