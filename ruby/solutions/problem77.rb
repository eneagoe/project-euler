$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "memoize"
require "prime"

include Memoize

# Solver for http://projecteuler.net/problem=77
class Problem77 < Problem
  def solve
    memoize :sopf
    memoize :part

    n = 1
    loop do
      break if part(n) > 5000
      n += 1
    end
    n
  end

  def part(n)
    return 1 if n == 0
    return 0 if n == 1
    (1..n).reduce(0) { |a, e| a + sopf(e) * part(n - e) } / n
  end

  def sopf(n)
    return 0 if n == 1
    n.prime_division.reduce(0) { |a, e| a + e[0] }
  end
end

puts Problem77.solution if $PROGRAM_NAME == __FILE__
