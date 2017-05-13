$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "memoist"
require "prime"

# Solves http://projecteuler.net/problem=77
class Problem
  class << self
    extend Memoist

    def solution_1
      n = 1
      loop do
        break if part(n) > 5000
        n += 1
      end
      n
    end

    def part(n)
      return 1 if n.zero?
      return 0 if n == 1
      (1..n).reduce(0) { |a, e| a + sopf(e) * part(n - e) } / n
    end

    def sopf(n)
      return 0 if n == 1
      n.prime_division.reduce(0) { |a, e| a + e[0] }
    end

    memoize :sopf
    memoize :part
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
