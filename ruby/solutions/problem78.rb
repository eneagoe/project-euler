$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem78 < Problem

  def solve

    p = []
    p[0], p[1] = 1, 1
    d = 1000000
    n = 1

    while p[n] != 0

      n += 1
      i = 0
      while true

        i += 1

        m1 = n - i * (3 * i - 1) / 2
        m2 = n - i * (3 * i + 1) / 2
        s = 1
        s = -1 if i % 2 == 0
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

if $PROGRAM_NAME == __FILE__
  puts Problem78.solution
end
