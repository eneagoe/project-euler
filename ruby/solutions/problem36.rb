$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=36
class Problem
  def self.solution_1
    # we don't need to check even numbers, in base 2 they end with 0
    (1...1_000_000).step(2).reduce(0) do |a, e|
      a + (e.to_s == e.to_s.reverse && e.to_s(2) == e.to_s(2).reverse ? e : 0)
    end
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
