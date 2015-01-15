$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=5
class Problem5v1 < Problem
  def solve
    # get the prime factorization of every number,
    # and multiply each factor to the highest power
    (2..20).flat_map { |i| Prime.prime_division(i) }.sort.reverse.
      uniq { |i| i[0] }.map { |i| i[0]**i[1] }.reduce(:*)
  end
end

puts Problem5v1.solution if $PROGRAM_NAME == __FILE__
