$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=39
class Problem
  # brute-force, extremely slow, but still within the 1m limit
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

  # take any two sides, find a third side that will form a right triangle,
  # and increase the count for the perimeter by 1, and finally take the max count
  def self.solution_2
    p = Hash.new(0)

    (1..998).each do |a|
      (a..998).each do |b|
        break if a + b > 1000
        c = Math.sqrt(a**2 + b**2).to_i
        break if a + b + c > 1000
        p[a + b + c] += 1 if c**2 == a**2 + b**2
      end
    end

    p.max_by { |k, v| v }.first
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
