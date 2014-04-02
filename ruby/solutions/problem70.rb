$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime_check"
require "digits"

# Solver for http://projecteuler.net/problem=70
class Problem70 < Problem
  def solve
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

puts Problem70.solution if $PROGRAM_NAME == __FILE__
