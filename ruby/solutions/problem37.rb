$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"

# Solves http://projecteuler.net/problem=37
class Problem
  def self.solution_1
    sum, found = 0, 0

    Prime.each do |n|
      next if n < 10
      i = n
      candidate = true
      while (i /= 10) && i.positive?
        candidate = false && break unless i.prime?
      end

      next unless candidate

      i = n
      while (i %= 10**Math.log10(i).to_i) && i.positive?
        candidate = false && break unless i.prime?
      end

      next unless candidate

      sum += n
      found += 1
      break if found >= 11
    end

    sum
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
