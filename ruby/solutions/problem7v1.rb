$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime_check"
require "odds"

# Solver for http://projecteuler.net/problem=7
class Problem7v1 < Problem
  def solve
    i = 0
    Odds.find do |n|
      i += 1 if prime?(n)
      i == 10_001
    end
  end
end

puts Problem7v1.solution if $PROGRAM_NAME == __FILE__
