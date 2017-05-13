$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=67
class Problem
  def self.solution_1
    triangle = []
    File.open("../support-files/triangle.txt", "r") do |f|
      f.each_with_index do |line, index|
        triangle[index] = line.split(/\s+/).map(&:to_i)
      end
    end

    (triangle.size - 2).downto(0).each do |row|
      (0..row).each do |column|
        triangle[row][column] +=
          [triangle[row + 1][column], triangle[row + 1][column + 1]].max
      end
    end

    triangle[0][0]
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
