$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem25_1 < Problem

  def solve
    # using F(n) = [phi**n/sqrt(5)]
    ((1000 - 1 + Math.log10(Math.sqrt(5))) / Math.log10((1+Math.sqrt(5))/2)).to_i + 1
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem25_1.solution
end
