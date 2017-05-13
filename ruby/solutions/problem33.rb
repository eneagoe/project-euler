$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "set"

# Solves http://projecteuler.net/problem=33
class Problem
  def self.solution_1
    fractions = []

    (1..9).each do |a|
      (1..9).each do |b|
        (1..9).each do |c|
          numerator = a * 10 + b
          fractions << Rational(numerator, b * 10 + c) if numerator.to_f / (b * 10 + c) == a.to_f / c.to_f && a.to_f / c.to_f < 1
          fractions << Rational(numerator, c * 10 + b) if numerator.to_f / (c * 10 + b) == a.to_f / c.to_f && a.to_f / c.to_f < 1
          fractions << Rational(numerator, a * 10 + c) if numerator.to_f / (a * 10 + c) == b.to_f / c.to_f && b.to_f / c.to_f < 1
        end
      end
    end

    fractions.reduce(:*).denominator
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
