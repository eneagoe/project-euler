$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=78
class Problem78 < Problem
  def solve # rubocop:disable MethodLength, CyclomaticComplexity
    p = []
    p[0], p[1] = 1, 1
    d = 1_000_000
    n = 1

    while p[n] != 0
      n += 1
      i = 0

      loop do
        i += 1
        m1 = n - i * (3 * i - 1) / 2
        m2 = n - i * (3 * i + 1) / 2
        s = 1
        s = -1 if i.even?
        p[n] = 0 if p[n].nil?
        p[n] += s * p[m1].to_i if m1 >= 0
        p[n] += s * p[m2].to_i if m2 >= 0
        break if m1 < 0 && m2 < 0
      end

      p[n] %= d
    end

    n
  end
end

puts Problem78.solution if $PROGRAM_NAME == __FILE__
