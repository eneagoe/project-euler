$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=57
class Problem
  def self.solution_1
    numerator, denominator = 1, 1

    (0..1000).count do
      c = denominator
      denominator = numerator + denominator
      numerator = denominator + c

      numerator.to_s.length > denominator.to_s.length
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
