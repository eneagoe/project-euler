$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem37 < Problem

  def solve

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

if $PROGRAM_NAME == __FILE__
  puts Problem37.solution
end
