$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "divisor_function"

# Solver for http://projecteuler.net/problem=12
class Problem12 < Problem
  TriangleEnum = Enumerator.new do |yielder|
    n = 0
    loop do
      n += 1
      yielder.yield(n * (n + 1) / 2)
    end
  end

  def solve
    TriangleEnum.each { |i| break i if count_divisors(i) >= 500 }
  end
end

puts Problem12.solution if $PROGRAM_NAME == __FILE__
