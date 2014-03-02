$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'fibonacci'

class Problem25 < Problem

  def solve
    limit = 10**999
    Fibonacci.each_with_index { |fib, i| break i + 1 if fib >= limit }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem25.solution
end
