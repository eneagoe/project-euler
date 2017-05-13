$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "pandigital"
require "set"

# Solves http://projecteuler.net/problem=38
class Problem
  def self.solution_1
    pandigitals = Set.new

    (1..98_765).each do |n|
      r, i = n, 2
      while r < 123_456_789
        r = r * 10**(Math.log10(i * n).to_i + 1) + i * n
        i += 1
      end
      next if r > 987_654_321
      pandigitals << r if pandigital?(r)
    end

    pandigitals.max
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
