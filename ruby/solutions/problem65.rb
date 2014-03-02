$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'digits'

class Problem65 < Problem

  def solve

    n = 100
    prev, current = 1, 2

    (2..n).each do |i|

      a = (i % 3 == 0) ? 2*i/3 : 1
      current, prev = prev + a*current, current

    end

    digits(current).reduce(:+)

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem65.solution
end
