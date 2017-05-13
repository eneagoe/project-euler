$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=69
class Problem
  def self.solution_1
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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
