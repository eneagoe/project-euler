$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=86
class Problem
  def self.solution_1
    current_solution, crt = 0, 2_500_000

    (1..2000).each do |m|
      new_round = true
      (1..2000).each do |n|
        count = s(m, n)
        if (2_000_000 - count).abs < crt
          current_solution = m * n
          crt = (2_000_000 - count).abs
          new_round = false
        else
          break unless new_round
        end
      end
    end

    current_solution
  end

  def self.s(m, n)
    m * (m + 1) * n * (n + 1) / 4
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
