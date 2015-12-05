$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=124
# brute-force using standard library factorization methods is fast enough
class Problem124 < Problem
  def solve
    limit = 100_000
    n = 10_000
    radicals = (1..limit).map do |i|
      [Prime.prime_division(i).reduce(1) { |a, e| a * e[0] }, i]
    end
    radicals.sort[n - 1].last
  end
end

puts Problem124.solution if $PROGRAM_NAME == __FILE__
