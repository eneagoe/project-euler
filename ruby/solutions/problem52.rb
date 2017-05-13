$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "digits"

# Solves http://projecteuler.net/problem=52
class Problem
  def self.solution_1
    n = 1
    loop do
      s = sorted_digits(n)
      break n if s == sorted_digits(2 * n) && s == sorted_digits(3 * n) &&
                 s == sorted_digits(4 * n) && s == sorted_digits(5 * n) &&
                 s == sorted_digits(6 * n)
      n += 1
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
