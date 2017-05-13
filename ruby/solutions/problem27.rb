$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=27
class Problem
  # brute-force; if we consider only primes for a, it takes about 4 times less
  def self.solution_1
    max, max_len = 999, 0
    crt_a, crt_b = 0, 0
    primes = (-max..max).select(&:prime?)
    odds = (-max..max).select(&:odd?)

    odds.each do |a|
      primes.each do |b|
        next if a == b
        n = 0
        n += 1 while (n * n + a * n + b).prime?
        crt_a, crt_b, max_len = a, b, n if max_len < n
      end
    end

    crt_a * crt_b
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
