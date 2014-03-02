$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'memoize'

class Problem14 < Problem

  include Memoize

  def solve
    memoize(:collatz_sequence_size) # without memoization it takes up to twice as long
    (1..1_000_000).max_by { |n| collatz_sequence_size(n) }
  end

  def collatz_sequence_size(n)
    n == 1 ? 1 : 1 + collatz_sequence_size(n.even? ? n/2 : 3*n + 1)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem14.solution
end
