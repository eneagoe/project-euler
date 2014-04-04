$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=90
class Problem90 < Problem
  attr_reader :squares

  def initialize
    @squares =
      (1..9).map { |i| (i**2).to_s.rjust(2, "0").split(//).map(&:to_i) }
  end

  def solve
    potentials = []
    arr = (0..9).to_a.combination(6).to_a

    (0..arr.size - 1).each do |i|
      (i + 1..arr.size - 1).each do |j|
        d1, d2 = arr[i].dup, arr[j].dup
        d1 << 6 if d1.include?(9)
        d1 << 9 if d1.include?(6)
        d2 << 6 if d2.include?(9)
        d2 << 9 if d2.include?(6)
        potentials << [d1.sort, d2.sort] if valid?(d1, d2)
      end
    end

    potentials.size
  end

  def valid?(d1, d2)
    squares.all? do |(t, u)|
      d1.include?(t) && d2.include?(u) || d2.include?(t) && d1.include?(u)
    end
  end
end

puts Problem90.solution if $PROGRAM_NAME == __FILE__
