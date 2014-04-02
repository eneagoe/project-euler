$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=3
class Problem3v1 < Problem
  def solve
    # this version is not significantly slower than the regular solution.
    # transpose will "unzip" the divisors array, and since they are
    # already sorted, we just take the last one
    Prime.prime_division(600_851_475_143).transpose.first.last
  end
end

puts Problem3v1.solution if $PROGRAM_NAME == __FILE__
