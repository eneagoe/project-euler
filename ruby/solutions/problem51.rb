$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime_check"
require "prime"

# brute-force, ugly, within 1m limit
# Solves http://projecteuler.net/problem=51
class Problem
  class << self
    def solution_1
      max_size = 8

      Prime.each do |n|
        next if n < 56_009
        break n if prime_family_match(n, max_size)
      end
    end

    def prime_family_match(n, max_size = 8)
      (0..9).each do |r|
        a = (0..9).map do |d|
          c = n.to_s.tr(r.to_s, d.to_s)
          c[0, 1] == "0" ? nil : c.to_i
        end
        return true if a.compact.select { |i| prime?(i) }.uniq.size == max_size
      end

      false
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
