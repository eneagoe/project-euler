$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solves http://projecteuler.net/problem=22
class Problem
  def self.solution_1
    File.read("../support-files/names.txt").split(",").
      sort.
      each_with_index.map { |name, i| (i + 1) * alpha_value(name) }.
      reduce(:+)
  end

  def self.alpha_value(s)
    s.delete('"').bytes.reduce(0) { |a, e| a + e.ord - 64 }
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
