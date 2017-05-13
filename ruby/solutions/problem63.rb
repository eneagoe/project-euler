$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=63
class Problem
  def self.solution_1
    powers, n = 0, 1

    while (n * Math.log10(9)).to_i > n - 2
      powers += (1..9).count { |i| (n * Math.log10(i)).to_i + 1 == n }
      n += 1
    end

    powers
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
