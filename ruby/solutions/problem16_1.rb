$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem16_1 < Problem

  def solve
    # this is slightly slower than just casting to string,
    # splitting in characters and adding the individual digit characters
    n, s = 2**1000, 0
    n, s = n / 10, s + n % 10 while n >= 10
    s + n
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem16_1.solution
end
