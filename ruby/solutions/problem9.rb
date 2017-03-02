$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=9
class Problem
  def self.solution_1
    (3..1000 / 3).each do |a|
      (a + 1..(1000 - a) / 2).each do |b|
        c = 1000 - a - b
        return a * b * c if a**2 + b**2 == c**2
      end
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
