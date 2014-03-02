$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem7 < Problem

  def solve
    Prime.take(10001).last
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem7.solution
end
