$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "digits"

# Solver for http://projecteuler.net/problem=52
class Problem52 < Problem
  def solve
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

puts Problem52.solution if $PROGRAM_NAME == __FILE__
