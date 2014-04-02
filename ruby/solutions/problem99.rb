$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=99
class Problem99 < Problem
  def solve
    File.foreach("../support-files/base_exp.txt").
      each_with_index.max_by do |line, i|
      a, b = line.split(/,/)
      b.to_i * Math.log(a.to_i)
    end.last + 1
  end
end

puts Problem99.solution if $PROGRAM_NAME == __FILE__
