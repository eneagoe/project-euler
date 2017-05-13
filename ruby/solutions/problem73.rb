$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=73
class Problem
  def self.solution_1
    d = 12_000

    (1..d - 1).map do |i|
      (i + 1..d).count do |n|
        r = i.to_f / n.to_f
        Rational(i, n).denominator >= n if 1 / 3.0 < r && 1 / 2.0 > r
      end
    end.reduce(:+)
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
