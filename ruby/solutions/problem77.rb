$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'memoize'
require 'prime'

include Memoize

class Problem77 < Problem

  def solve

    memoize :sopf
    memoize :part

    n = 1
    while true
      break if part(n) > 5000
      n += 1
    end
    @solution = n

  end

  def part(n)

    return 1 if n == 0
    return 0 if n == 1

    (1..n).reduce(0) { |sum, k| sum += sopf(k)*part(n-k) } / n

  end

  def sopf(n)
    return 0 if n == 1
    n.prime_division.reduce(0) { |sum, i| sum += i[0] }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem77.solution
end
