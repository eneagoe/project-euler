$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "prime_check"

# Solves http://projecteuler.net/problem=50
class Problem
  def self.solution_1
    n = 1_000_000
    primes = Prime.take_while { |p| p < 1_000_000 }
    solution, max = primes[0], 1

    (0..primes.count - 2).each do |i|
      break if i > n / 2

      s, j = primes[i], i + 1
      while s < n
        s += primes[j]
        j += 1
        solution, max = s, j - i if prime?(s) && s < n && max < j - i
      end
    end

    solution
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
