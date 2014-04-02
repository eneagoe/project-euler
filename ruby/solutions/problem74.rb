$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "digits"

# Solver for http://projecteuler.net/problem=74
# brute-force, extremely slow
class Problem74 < Problem
  def solve
    f = (1..9).map { |i| (1..i).reduce(:*) }.unshift 1

    (1..1_000_000).count do |n|
      f_chain, crt = [n], n

      loop do
        s = digits(crt).reduce(0) { |a, e| a + f[e] }
        break if f_chain.include?(s)
        f_chain << s
        break if f_chain.size > 60
        crt = s
      end

      f_chain.size == 60
    end
  end
end

puts Problem74.solution if $PROGRAM_NAME == __FILE__
