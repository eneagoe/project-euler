$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "odds"
require "prime"

# Solver for http://projecteuler.net/problem=46
class Problem46 < Problem
  def solve
    Odds.each do |n|
      next if n.prime? || n <= 33
      validated = false

      Prime.take_while { |p| p <= n - 2 }.each do |p|
        validated = true if Math.sqrt((n - p) / 2.0) % 1 == 0
      end

      break n unless validated
    end
  end
end

puts Problem46.solution if $PROGRAM_NAME == __FILE__
