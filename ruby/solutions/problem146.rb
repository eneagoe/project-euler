$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime_check"

# Solver for http://projecteuler.net/problem=146
class Problem146 < Problem
  # extremely slow even with search space reduction and
  # fast prime detection
  def solve
    10.step(150_000_000, 10).select { |n| valid?(n * n) }.reduce(:+)
  end

  def valid?(n) # rubocop:disable CyclomaticComplexity
    return false unless n.even? || n % 3 == 0
    return false if n % 9 == 0 || n % 13 == 0 || n % 19 == 0 ||
      n % 13 == 0 || n % 27 == 0
    return false if miller_rabin_prime?(n + 19, 100) ||
      miller_rabin_prime?(n + 21, 100)
    [n + 1, n + 3, n + 7, n + 9, n + 13,  n + 27].each do |i|
      return false unless miller_rabin_prime?(i, 100)
    end
    true
  end
end

puts Problem146.solution if $PROGRAM_NAME == __FILE__
