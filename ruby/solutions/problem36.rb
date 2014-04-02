$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=36
class Problem36 < Problem
  def solve
    # we don't need to check even numbers, in base 2 they end with 0
    (1...1_000_000).step(2).reduce(0) do |a, e|
      a + (e.to_s == e.to_s.reverse && e.to_s(2) == e.to_s(2).reverse ? e : 0)
    end
  end
end

puts Problem36.solution if $PROGRAM_NAME == __FILE__
