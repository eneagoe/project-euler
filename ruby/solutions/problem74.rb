$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "digits"

# Solves http://projecteuler.net/problem=74
# FIXME: brute-force, extremely slow, within 1m limit
class Problem
  def self.solution_1
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

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
