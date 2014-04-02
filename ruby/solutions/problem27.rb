$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=27
class Problem27 < Problem
  # brute-force, takes about 8 seconds
  # if we consider only primes for a, it takes about 2 seconds
  def solve
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

puts Problem27.solution if $PROGRAM_NAME == __FILE__
