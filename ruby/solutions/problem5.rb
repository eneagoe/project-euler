$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "gcd"

# Solves http://projecteuler.net/problem=5
class Problem
  def self.solution_1
    (2..20).reduce do |a, e|
      ((a % e).zero? && a) || (a * ((p = gcd(a, e)) != 1 && p || e))
    end
  end

  def self.solution_2
    # get the prime factorization of every number,
    # and multiply each factor to the highest power
    (2..20).flat_map { |i| Prime.prime_division(i) }.sort.reverse.
      uniq { |i| i[0] }.map { |i| i[0]**i[1] }.reduce(:*)
  end

  def self.solution_3
    (2..20).reduce(:lcm)
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
