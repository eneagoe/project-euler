$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=124
# brute-force using standard library factorization methods is fast enough
class Problem
  def self.solution_1
    limit = 100_000
    n = 10_000
    radicals = (1..limit).map do |i|
      [Prime.prime_division(i).reduce(1) { |a, e| a * e[0] }, i]
    end
    radicals.sort[n - 1].last
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
