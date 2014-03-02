$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'set'

class Problem33 < Problem

  def solve

    fractions = []

    (1..9).each do |a|
      (1..9).each do |b|
        (1..9).each do |c|
          numerator = a*10 + b
          fractions << Rational(numerator, b*10 + c) if numerator.to_f/(b*10 + c) == a.to_f/c.to_f && a.to_f/c.to_f < 1
          fractions << Rational(numerator, c*10 + b) if numerator.to_f/(c*10 + b) == a.to_f/c.to_f && a.to_f/c.to_f < 1
          fractions << Rational(numerator, a*10 + c) if numerator.to_f/(a*10 + c) == b.to_f/c.to_f && b.to_f/c.to_f < 1
        end
      end
    end

    fractions.reduce(:*).denominator

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem33.solution
end
