$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "set"

# Solves http://projecteuler.net/problem=32
class Problem
  # brute-force, very ugly
  def self.solution_1
    valid = Set.new
    (1..9).to_a.permutation.each do |p|
      n = p.join.to_i
      p1 = n % 10_000 # last 4 digits
      p2 = n % 100_000 # last 5 digits
      p01 = n / 10_000_000 # first 2 digits
      p02 = n / 1_000_000 # first 3 digits
      p03 = n / 100_000 # first 4 digits
      p14 = (n / 10_000) % 10_000
      p24 = p14 % 1000
      p23 = p2 % 100
      p34 = p24 % 100

      if p[0] * p14 == p1 || p01 * p24 == p1 ||
         p02 * p34 == p1 || p03 * p[4] == p1
        valid << p1
      elsif p01 * p23 == p2
        valid << p2
      end
    end

    valid.reduce(:+)
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
