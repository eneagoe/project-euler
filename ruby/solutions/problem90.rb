$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=90
class Problem
  SQUARES = (1..9).map { |i| (i**2).to_s.rjust(2, "0").split(//).map(&:to_i) }

  def self.solution_1
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

  def self.valid?(d1, d2)
    SQUARES.all? do |(t, u)|
      d1.include?(t) && d2.include?(u) || d2.include?(t) && d1.include?(u)
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
