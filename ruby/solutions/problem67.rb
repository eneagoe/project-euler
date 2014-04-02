$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=67
class Problem67 < Problem
  attr_accessor :triangle

  def initialize
    @triangle = []
    File.open("../support-files/triangle.txt", "r") do |f|
      f.each_with_index do |line, index|
        @triangle[index] = line.split(/\s+/).map(&:to_i)
      end
    end
  end

  def solve
    (triangle.size - 2).downto(0).each do |row|
      (0..row).each do |column|
        triangle[row][column] +=
          [triangle[row + 1][column], triangle[row + 1][column + 1]].max
      end
    end

    triangle[0][0]
  end
end

puts Problem67.solution if $PROGRAM_NAME == __FILE__
