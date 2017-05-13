$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "arithmetic_progression"

# Solves http://projecteuler.net/problem=49
class Problem
  class << self
    def solution_1
      (1001..9997).each do |p|
        if p.prime? && arithmetic_progression?(prime_family(p).sort)
          return prime_family(p).join
        end
      end
    end

    def prime_family(n)
      a = n.to_s.split(//).permutation.select do |p|
        p = p.join.to_i
        p.prime? && p >= n
      end
      a.map { |p| p.join.to_i }.uniq.sort
    end
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
