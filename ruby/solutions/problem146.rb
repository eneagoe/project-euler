$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime_check"

# Solves http://projecteuler.net/problem=146
class Problem
  # FIXME: extremely slow even with search space reduction and
  # fast prime detection
  def self.solution_1
    10.step(150_000_000, 10).select { |n| valid?(n * n) }.reduce(:+)
  end

  def self.valid?(n)
    return false unless n.even? || (n % 3).zero?
    return false if (n % 9).zero? || (n % 13).zero? || (n % 19).zero? ||
                    (n % 13).zero? || (n % 27).zero?
    return false if miller_rabin_prime?(n + 19, 100) ||
                    miller_rabin_prime?(n + 21, 100)
    [n + 1, n + 3, n + 7, n + 9, n + 13,  n + 27].each do |i|
      return false unless miller_rabin_prime?(i, 100)
    end
    true
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
