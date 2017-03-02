$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=10
class Problem
  def self.solution_1
    sum = 0
    Prime.each { |i| break sum if i > 2_000_000; sum += i }
  end

  # a slightly slower but more readable solution would be
  def self.solution_2
    Prime.take_while { |i| i < 2_000_000 }.reduce(:+)
  end

  def self.solution_3
    require "prime_check"
    (2..2_000_000).select { |i| prime?(i) }.reduce(:+)
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
