$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'pentagonal'

class Problem45 < Problem

  def solve

    # use T(n) = P(m) = H(p) to derive the condition below ...
    # ... and start above the known m
    m = 166
    while true
      break pentagonal(m) if (Math.sqrt(12*m**2 - 4*m + 1) + 1) % 4 == 0
      m += 1
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem45.solution
end
