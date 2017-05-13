$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "roman"

# Solves http://projecteuler.net/problem=89
class Problem
  def self.solution_1
    File.open("../support-files/roman.txt", "r").map do |s|
      s.chomp!
      s.size - i_to_roman(roman_to_i(s)).size
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
