$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "triangle"

# Solves http://projecteuler.net/problem=42
class Problem
  class << self
    def solution_1
      words = File.read("../support-files/words.txt").split(",")
      words.count { |word| triangle?(word_value(word)) }
    end

    def word_value(s)
      s.delete('"').each_char.reduce(0) { |a, e| a + (e.ord - 64) }
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
