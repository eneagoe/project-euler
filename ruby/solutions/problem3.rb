$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem3 < Problem

  def solve

    n, f = 600851475143, 2

    n % f == 0 ? n /= f : f += 1 while n != f

    n

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem3.solution
end
