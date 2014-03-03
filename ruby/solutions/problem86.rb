$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem86 < Problem

  def solve

    m = 1
    count = 0
    target = 1_000_000

    while count < target

      m += 1

      (3..2*m).each do |wh|
        d = Math.sqrt(wh**2 + m**2)
        if d % 1 == 0
          count += (wh <= m) ? wh / 2 : 1 + (m - (wh + 1) / 2)
        end
      end

    end

    m

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem86.solution
end
