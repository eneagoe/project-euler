$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=53
class Problem53 < Problem
  def solve
    fact = (1..100).map { |i| (1..i).reduce(:*) }

    (23..100).map do |n|
      (1..100).count do |k|
        fact[n - 1] / (fact[k - 1] * fact[n - k - 1]) >= 1_000_000
      end
    end.reduce(:+)
  end
end

puts Problem53.solution if $PROGRAM_NAME == __FILE__
