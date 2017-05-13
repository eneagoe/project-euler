$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime_check"
require "set"

# Solves http://projecteuler.net/problem=87
class Problem
  def self.solution_1
    limit = 50 * 10**6

    solution_set = Set.new
    x2, x3, x4 = Math.sqrt(limit).to_i + 1,
                 (limit**(1 / 3.0)).to_i + 1,
                 (limit**(1 / 4.0)).to_i + 1
    primes2 = (2..x2).select { |n| prime?(n) }
    primes3 = (2..x3).select { |n| prime?(n) }
    primes4 = (2..x4).select { |n| prime?(n) }

    primes2.each do |x|
      primes3.each do |y|
        a = x**2 + y**3
        break if a > limit

        primes4.each do |z|
          n = x**2 + y**3 + z**4
          break if n > limit
          solution_set << n
        end
      end
    end

    solution_set.count
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
