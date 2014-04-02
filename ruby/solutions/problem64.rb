$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=64
# see http://en.wikipedia.org/wiki/Methods_of_computing_square_roots
class Problem64 < Problem
  def solve
    (2..10_000).count do |s|
      next if Math.sqrt(s) % 1 == 0

      m, d, a = 0, 1, Math.sqrt(s).to_i
      period, prev = [], []

      loop do
        next_m = d * a - m
        next_d = (s - next_m**2) / d
        next_a = ((Math.sqrt(s) + next_m) / next_d).to_i

        break if prev.include?([next_m, next_d, next_a])

        period << next_a
        prev << [next_m, next_d, next_a]

        m, d, a = next_m, next_d, next_a
      end

      period.size.odd?
    end
  end
end

puts Problem64.solution if $PROGRAM_NAME == __FILE__
