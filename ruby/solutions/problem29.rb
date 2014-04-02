$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "set"

# Solver for http://projecteuler.net/problem=29
class Problem29 < Problem
  def solve
    n, seq = 100, Set.new

    (2..n).each do |a|
      (2..n).each { |b| seq << a**b }
    end

    seq.size
  end
end

puts Problem29.solution if $PROGRAM_NAME == __FILE__
