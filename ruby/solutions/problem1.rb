$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem1 < Problem

  def initialize
    @n = 1000
  end

  def solve
     (0...@n).find_all { |i| i % 3 == 0 || i % 5 == 0 }.reduce(:+)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem1.solution
end
