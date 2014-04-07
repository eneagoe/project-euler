$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "palindrome"

# Solver for http://projecteuler.net/problem=145
class Problem145 < Problem
  def solve
    # mainly brute force, very slow
    # there are no single, 5-digits, or 9-digits reversible numbers
    [2, 3, 4, 6, 7, 8].reduce(0) do |a, e|
      rev_count = (10**(e - 1) + 1..10**e - 1).count do |i|
        next if i % 10 == 0
        n = i + reverse(i)
        valid = true
        while n > 0
          n, r = n.divmod(10)
          valid = false && break if r.even?
        end
        valid
      end
      a + rev_count
    end
  end
end

puts Problem145.solution if $PROGRAM_NAME == __FILE__
