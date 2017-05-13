$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# brute-force, very ugly, but fast
# Solves for http://projecteuler.net/problem=40
class Problem
  def self.solution_1
    s = (0..654_321).to_a.join
    [s[1], s[10], s[100], s[1000], s[10_000], s[100_000], s[1_000_000]].
      map(&:to_i).reduce(:*)
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
