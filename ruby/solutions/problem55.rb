$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "palindrome"

# Solves http://projecteuler.net/problem=55
class Problem
  class << self
    def solution_1
      (1..10_000).count { |i| lychrel?(i) }
    end

    def lychrel?(n)
      50.times do
        n += reverse(n)
        return false if palindrome?(n)
      end
      true
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
