$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem48 < Problem

  def solve
    (1..1000).reduce(0) { |sum, n| sum += n**n } % 10000000000
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem48.solution
end
