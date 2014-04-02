$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "problem"
require "arithmetic_progression"

# Solver for http://projecteuler.net/problem=49
class Problem49 < Problem
  def solve
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

puts Problem49.solution if $PROGRAM_NAME == __FILE__
