$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=86
class Problem86 < Problem
  def solve
    m = 1
    count = 0
    target = 1_000_000

    while count < target
      m += 1

      (3..2 * m).each do |wh|
        d = Math.sqrt(wh**2 + m**2)
        count += (wh <= m) ? wh / 2 : 1 + (m - (wh + 1) / 2) if d % 1 == 0
      end
    end

    m
  end
end

puts Problem86.solution if $PROGRAM_NAME == __FILE__
