$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "duplicates"

# Solves http://projecteuler.net/problem=75
class Problem
  def self.solution_1
    found = []
    n = 1_500_000
    primitives = [[3, 4, 5]]
    u = [[1, 2, 2], [-2, -1, -2], [2, 2, 3]]
    a = [[1, 2, 2], [2, 1, 2], [2, 2, 3]]
    d = [[-1, -2, -2], [2, 1, 2], [2, 2, 3]]

    until primitives.empty?
      a0 = primitives.shift
      found << a0
      sum = a0.reduce(:+)
      i = 2
      while sum <= n
        mul = a0.map { |x| x * i }
        i += 1
        sum = mul.reduce(:+)
        found << mul if sum <= n
      end

      a1 = []
      a1[0] = a0[0] * u[0][0] + a0[1] * u[1][0] + a0[2] * u[2][0]
      a1[1] = a0[0] * u[0][1] + a0[1] * u[1][1] + a0[2] * u[2][1]
      a1[2] = a0[0] * u[0][2] + a0[1] * u[1][2] + a0[2] * u[2][2]

      primitives << a1 unless a1.reduce(:+) > n

      a2 = []
      a2[0] = a0[0] * a[0][0] + a0[1] * a[1][0] + a0[2] * a[2][0]
      a2[1] = a0[0] * a[0][1] + a0[1] * a[1][1] + a0[2] * a[2][1]
      a2[2] = a0[0] * a[0][2] + a0[1] * a[1][2] + a0[2] * a[2][2]

      primitives << a2 unless a2.reduce(:+) > n

      a3 = []
      a3[0] = a0[0] * d[0][0] + a0[1] * d[1][0] + a0[2] * d[2][0]
      a3[1] = a0[0] * d[0][1] + a0[1] * d[1][1] + a0[2] * d[2][1]
      a3[2] = a0[0] * d[0][2] + a0[1] * d[1][2] + a0[2] * d[2][2]

      primitives << a3 unless a3.reduce(:+) > n
    end

    found = found.map { |s| s.reduce(:+) }.sort
    dups = found.dups

    (found - dups).count
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
