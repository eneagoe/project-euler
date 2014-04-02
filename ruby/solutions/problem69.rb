$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=69
class Problem69 < Problem
  def solve
    n = 1_000_000
    primes = Prime.lazy

    i, p, current_solution = 0, 1, 1
    loop do
      p *= primes.next
      break if p >= n
      i += 1
      current_solution = p
    end

    current_solution
  end
end

puts Problem69.solution if $PROGRAM_NAME == __FILE__
