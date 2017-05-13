$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=14
class Problem
  class << self
    def solution_1
      (1..1_000_000).max_by { |n| collatz_sequence_size(n) }
    end

    def collatz_sequence_size(n)
      return 1 if n == 1
      1 + collatz_sequence_size(n.even? ? n / 2 : 3 * n + 1)
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
