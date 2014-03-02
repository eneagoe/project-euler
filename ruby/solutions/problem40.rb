$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

# brute-force, very ugly
class Problem40 < Problem

  def solve
    s = (0..654321).to_a.join
    [s[1], s[10], s[100], s[1000], s[10000], s[100000], s[1000000]].map { |x| x.to_i }.reduce(:*)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem40.solution
end
