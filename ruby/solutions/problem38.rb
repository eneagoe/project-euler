$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "pandigital"
require "set"

# Solver for http://projecteuler.net/problem=38
class Problem38 < Problem
  def solve
    pandigitals = Set.new

    (1..98_765).each do |n|
      r, i = n, 2
      while r < 123_456_789
        r = r * 10**(Math.log10(i * n).to_i + 1) + i * n
        i += 1
      end
      pandigitals << r if pandigital?(r) unless r > 987_654_321
    end

    pandigitals.max
  end
end

puts Problem38.solution if $PROGRAM_NAME == __FILE__
