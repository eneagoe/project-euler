$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "palindrome"

# Solves http://projecteuler.net/problem=4
class Problem
  def self.solution_1
    max = 0

    999.downto(101).each do |i|
      # every six-digit palindrome is of the form
      # 11(9091a + 910b+100c), so at least one of the
      # three-digit numbers must be divisible by 11
      j = 990
      while j >= 101
        product = i * j
        break if product <= max
        max = product if palindrome?(product)
        j -= 11
      end
    end

    max
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
