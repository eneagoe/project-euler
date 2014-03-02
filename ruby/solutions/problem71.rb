$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem71 < Problem

  def solve

    d, a, b = 1000000, 2, 5

    while true

      b += 7
      break a if b > d
      a += 3

    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem71.solution
end
