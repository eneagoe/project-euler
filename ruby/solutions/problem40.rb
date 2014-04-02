$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# brute-force, very ugly
# Solver for http://projecteuler.net/problem=40
class Problem40 < Problem
  def solve
    s = (0..654_321).to_a.join
    [s[1], s[10], s[100], s[1000], s[10_000], s[100_000], s[1_000_000]].
      map { |x| x.to_i }.reduce(:*)
  end
end

puts Problem40.solution if $PROGRAM_NAME == __FILE__
