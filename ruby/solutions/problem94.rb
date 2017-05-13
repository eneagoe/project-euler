$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=94
# all perimeters are 3*a + 1, or 3*a - 1. Use Wolframalpha to find the formulas
# for the integer solutions for triangle areas
class Problem
  def self.solution_1
    limit = 10**9
    sum = 0

    (1..10).each do |n|
      # look for a, a, a + 1 solutions
      a = ((7 - 4 * Math.sqrt(3))**n + (7 + 4 * Math.sqrt(3))**n + 1) / 3.0
      a = a.round
      p = 3 * a + 1
      rad = Math.sqrt(3 * a**2 - 2 * a - 1)
      t = (a + 1) * rad.round / 4.0
      sum += p if p < limit if t == t.to_i

      # look for a, a, a - 1 solutions
      t1 = 7 - 4 * Math.sqrt(3)
      t2 = 7 + 4 * Math.sqrt(3)
      a = (2 * t1**n + Math.sqrt(3) * t1**n + 2 * t2**n - Math.sqrt(3) * t2**n - 1) / 3.0
      a = a.round
      p = 3 * a - 1
      rad = Math.sqrt(3 * a**2 + 2 * a - 1)
      t = (a - 1) * rad.round / 4.0
      sum += p if p < limit if t == t.to_i && a != 1
      break if p >= limit
    end

    sum
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
