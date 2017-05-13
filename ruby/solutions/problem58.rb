$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime_check"

# Solves http://projecteuler.net/problem=58
class Problem
  def self.solution_1
    primes = 0
    n = 3

    loop do
      primes += 1 if prime?((n - 1)**2 + 1)
      primes += 1 if prime?(n * n - n + 1)
      primes += 1 if prime?(n * n - 3 * n + 3)

      percentage = primes.to_f / (2 * n - 1).to_f
      break n if percentage < 0.1

      n += 2
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
