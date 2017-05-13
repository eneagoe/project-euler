$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=31
class Problem
  COINS = [1, 2, 5, 10, 20, 50, 100, 200].freeze

  def self.count_change(n, m)
    if n.zero?
      1
    elsif n.negative?
      0
    elsif m.negative? && n >= 1
      0
    else
      count_change(n, m - 1) + count_change(n - COINS[m], m)
    end
  end

  def self.solution_1
    count_change(200, COINS.size - 1)
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
