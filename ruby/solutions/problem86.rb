$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=86
class Problem
  def self.solution_1
    m = 1
    count = 0
    target = 1_000_000

    while count < target
      m += 1

      (3..2 * m).each do |wh|
        d = Math.sqrt(wh**2 + m**2)
        count += wh <= m ? wh / 2 : 1 + (m - (wh + 1) / 2) if (d % 1).zero?
      end
    end

    m
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
