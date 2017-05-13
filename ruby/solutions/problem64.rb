$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=64
# see http://en.wikipedia.org/wiki/Methods_of_computing_square_roots
class Problem
  def self.solution_1
    (2..10_000).count do |s|
      next if (Math.sqrt(s) % 1).zero?

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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
