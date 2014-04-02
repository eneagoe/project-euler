$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "memoize"

# Solver for http://projecteuler.net/problem=14
class Problem14 < Problem
  include Memoize

  def solve
    # without memoization it takes up to twice as long
    memoize(:collatz_sequence_size)
    (1..1_000_000).max_by { |n| collatz_sequence_size(n) }
  end

  def collatz_sequence_size(n)
    return 1 if n == 1
    1 + collatz_sequence_size(n.even? ? n / 2 : 3 * n + 1)
  end
end

puts Problem14.solution if $PROGRAM_NAME == __FILE__
