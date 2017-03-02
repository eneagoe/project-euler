$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=7
class Problem
  def self.solution_1
    Prime.take(10_001).last
  end

  def self.solution_2
    require "prime_check"
    require "odds"

    i = 0
    Odds.find do |n|
      i += 1 if prime?(n)
      i == 10_001
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
