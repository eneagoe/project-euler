$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem97 < Problem

  def solve

    prime, n = 28433, 7830457

    prime = (prime << 1) % 10000000000 while (n -= 1) >= 0

    prime + 1

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem97.solution
end
