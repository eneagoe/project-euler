$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "palindrome"

# Solver for http://projecteuler.net/problem=4
class Problem4 < Problem
  def solve
    max = 0

    999.downto(101).each do |i|
      # every six-digits palindromes is of the form
      # 11(9091a + 910b+100c), so at least one of the
      # three-digits numbers must be divisible by 11
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

puts Problem4.solution if $PROGRAM_NAME == __FILE__
