$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'memoize'
include Memoize

class Problem76 < Problem

  def solve

    memoize(:partition)
    partition(100) - 1

  end

  # partition function using Euler's formula
  def partition(n)
    return 1 if n == 1 || n == 0
    return 0 if n < 0
    (1..n).map { |k| (-1)**(k+1)*(partition(n - k*(3*k-1)/2) + partition(n - k*(3*k+1)/2)) }.reduce(:+)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem76.solution
end
