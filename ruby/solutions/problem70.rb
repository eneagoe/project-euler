$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime_check"
require "digits"

# Solves http://projecteuler.net/problem=70
class Problem
  def self.solution_1
    n, min = 10**7, 10**7
    primes = (1000..9999).select { |i| prime?(i) }
    current_solution = primes.first

    primes.each do |a|
      primes.each do |b|
        i = a * b
        next if i > n

        pi = (a - 1) * (b - 1)
        q = i / pi.to_f

        if (q < min) && sorted_digits(i) == sorted_digits(pi)
          current_solution, min = i, q
        end
      end
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
