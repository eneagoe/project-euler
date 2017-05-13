$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "odds"
require "prime"

# Solves http://projecteuler.net/problem=46
class Problem
  def self.solution_1
    Odds.each do |n|
      next if n.prime? || n <= 33
      validated = false

      Prime.take_while { |p| p <= n - 2 }.each do |p|
        validated = true if (Math.sqrt((n - p) / 2.0) % 1).zero?
      end

      break n unless validated
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
