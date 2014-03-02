$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem15 < Problem

  def solve
    # the answer is 40 choose 20
    n = (1..20).reduce(:*)
    (21..40).reduce(:*)/n
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem15.solution
end
