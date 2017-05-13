$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "number_rotations"
require "prime"

# Solves http://projecteuler.net/problem=35
class Problem
  class << self
    def solution_1
      Prime.take_while { |n| n < 1_000_000 }.count do |n|
        !invalid_digits(n) && rotations(n).all?(&:prime?)
      end
    end

    def invalid_digits(n)
      return false if [2, 5].include?(n)
      while n != 0
        n, r = n / 10, n % 10
        return true if [0, 2, 4, 5, 6, 8].include?(r)
      end
      false
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
