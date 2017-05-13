$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# brute-force, extremely slow, but still within the 1m limit
# Solves http://projecteuler.net/problem=39
class Problem
  def self.solution_1
    (0..1000).map do |p|
      solutions = 0
      (1..p - 2).each do |c|
        (1..p - c - 1).each do |b|
          a = p - c - b
          solutions += 1 if c * c == a * a + b * b
        end
      end

      solutions
    end.each_with_index.max[1]
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
