$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "roman"

# Solver for http://projecteuler.net/problem=89
class Problem89 < Problem
  def solve
    File.open("../support-files/roman.txt", "r").map do |s|
      s.chomp!
      s.size - i_to_roman(roman_to_i(s)).size
    end.reduce(:+)
  end
end

puts Problem89.solution if $PROGRAM_NAME == __FILE__
