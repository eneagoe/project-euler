$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem28 < Problem

  def solve
    1 + (3..1001).map { |n| n.even? ? 0 : sum(n) }.reduce(:+)
  end

  def sum(n)
    n*n + (n - 1)**2 + 1 + n*n - n + 1 + n*n - 3*n + 3
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem28.solution
end
