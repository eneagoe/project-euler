$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=34
class Problem
  def self.solution_1
    # precompute the factorials
    facts = [1] + (1..9).map { |n| (1..n).reduce(:*) }

    (1..999_999).map do |n|
      r, s = n, 0
      r, s = r / 10, (s + facts[r % 10]) while r != 0
      s == n ? n : 0
    end.reduce(:+) - 3 # substract 1 and 2, they are not sums
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
