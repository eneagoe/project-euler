$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=30
class Problem
  class << self
    def solution_1
      (2..354_294).reduce(0) do |a, e|
        a + (e == sum_of_powers(e) ? e : 0)
      end
    end

    def powers
      @powers ||= (0..9).map { |i| i**5 }
    end

    def sum_of_powers(n)
      n.to_s.split(//).reduce(0) { |a, e| a + powers[e.to_i] }
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
