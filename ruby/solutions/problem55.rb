$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "palindrome"

# Solver for http://projecteuler.net/problem=55
class Problem55 < Problem
  def solve
    (1..10_000).count { |i| lychrel?(i) }
  end

  def lychrel?(n)
    (1..50).each do |i|
      n += reverse(n)
      return false if palindrome?(n)
    end
    true
  end
end

puts Problem55.solution if $PROGRAM_NAME == __FILE__
