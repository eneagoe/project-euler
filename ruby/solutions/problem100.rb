$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=100
# the problems reduces to finding solutions to Pell's equation:
# 8r^2 + 1 = k^2. Use WolframAlpha to determine possible solution forms, then
# we loop through the first solution (they grow quickly), and pick the first
# one bigger than 10^12
class Problem
  def self.solution_1
    c = 2 * Math.sqrt(2)
    limit = 10**12
    (1..20).each do |n|
      r = ((3 + c)**n - (3 - c)**n) / (2 * c)
      b = (2 * r + 1 + Math.sqrt(8 * r**2 + 1)) / 2
      break b.round if b + r > limit
    end
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
