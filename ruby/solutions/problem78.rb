$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=78
class Problem
  def self.solution_1
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
        break if m1.negative? && m2.negative?
      end

      p[n] %= d
    end

    n
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
