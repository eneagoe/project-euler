$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime_check'
require 'odds'

class Problem7_1 < Problem

  def solve

    i = 0

    Odds.detect do |n|
      i += 1 if prime?(n)
      i == 10001
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem7_1.solution
end
