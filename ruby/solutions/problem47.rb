$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem47 < Problem

  def solve
    n = 1
    n = n + 1 while [n, n+1, n+2, n+3].map { |i| i.prime_division.size } != [4, 4, 4, 4]
    n
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem47.solution
end
