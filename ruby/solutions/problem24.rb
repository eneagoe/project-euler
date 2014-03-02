$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem24 < Problem

  def solve
    (0..9).to_a.permutation.to_a[999999].join
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem24.solution
end
