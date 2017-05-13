$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "divisor_function"

# Solves http://projecteuler.net/problem=12
class Problem
  TriangleEnum = Enumerator.new do |yielder|
    n = 0
    loop do
      n += 1
      yielder.yield(n * (n + 1) / 2)
    end
  end

  def self.solution_1
    TriangleEnum.lazy.drop_while { |i| count_divisors(i) < 500 }.first
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
