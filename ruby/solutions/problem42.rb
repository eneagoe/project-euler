$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "triangle"

# Solver for http://projecteuler.net/problem=42
class Problem42 < Problem
  def solve
    words = File.read("../support-files/words.txt").split(",")
    words.count { |word| triangle?(word_value(word)) }
  end

  def word_value(s)
    s.gsub(/"/, "").each_char.reduce(0) { |a, e| a + (e.ord - 64) }
  end
end

puts Problem42.solution if $PROGRAM_NAME == __FILE__
