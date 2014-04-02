$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "prime"

# Solver for http://projecteuler.net/problem=37
class Problem37 < Problem
  def solve # rubocop:disable MethodLength, CyclomaticComplexity
    sum, found = 0, 0

    Prime.each do |n|
      next if n < 10
      i = n
      candidate = true
      while (i /= 10) && (i > 0)
        candidate = false && break unless i.prime?
      end

      if candidate
        i = n
        while (i %= 10**Math.log10(i).to_i) && (i > 0)
          candidate = false && break unless i.prime?
        end

        if candidate
          sum += n
          found += 1
          break if found >= 11
        end
      end
    end

    sum
  end
end

puts Problem37.solution if $PROGRAM_NAME == __FILE__
