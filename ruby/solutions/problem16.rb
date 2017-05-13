$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=16
class Problem
  def self.solution_1
    (2**1000).to_s.enum_for(:each_char).reduce(0) { |a, e| a + e.to_i }
  end

  def self.solution_2
    # this is slightly slower than just casting to string,
    # splitting in characters and adding the individual digit characters
    n, s = 2**1000, 0
    n, s = n / 10, s + n % 10 while n >= 10
    s + n
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
