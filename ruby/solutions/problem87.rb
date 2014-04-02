$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime_check"
require "set"

# Solver for http://projecteuler.net/problem=87
class Problem87 < Problem
  def solve # rubocop:disable MethodLength
    limit = 50 * 10**6

    solution_set = Set.new
    x2, x3, x4 = Math.sqrt(limit).to_i + 1,
                 (limit**(1 / 3.0)).to_i + 1,
                 (limit**(1 / 4.0)).to_i + 1
    primes2 = (2..x2).reject { |n| !prime?(n) }
    primes3 = (2..x3).reject { |n| !prime?(n) }
    primes4 = (2..x4).reject { |n| !prime?(n) }

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

puts Problem87.solution if $PROGRAM_NAME == __FILE__
