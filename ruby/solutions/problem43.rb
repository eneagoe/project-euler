$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# brute-force, very ugly, within 1m limit
# Solves http://projecteuler.net/problem=43
class Problem
  def self.solution_1
    acc = (0..9).to_a.permutation.select do |p|
      p = p.join
      p[1..3].to_i.even? && (p[2..4].to_i % 3).zero? &&
        (p[3..5].to_i % 5).zero? && (p[4..6].to_i % 7).zero? &&
        (p[5..7].to_i % 11).zero? && (p[6..8].to_i % 13).zero? &&
        (p[7..9].to_i % 17).zero?
    end
    acc.reduce(0) { |a, e| a + e.join.to_i }
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
