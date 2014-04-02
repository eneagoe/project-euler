$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=31
class Problem31 < Problem
  attr_reader :coins

  def initialize
    @coins = [1, 2, 5, 10, 20, 50, 100, 200]
  end

  def count_change(n, m)
    if n == 0
      1
    else
      if n < 0
        0
      else
        if m < 0 && n >= 1
          0
        else
          count_change(n, m - 1) + count_change(n - @coins[m], m)
        end
      end
    end
  end

  def solve
    count_change(200, @coins.size - 1)
  end
end

puts Problem31.solution if $PROGRAM_NAME == __FILE__
