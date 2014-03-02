$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem16 < Problem

  def solve
    (2**1000).to_s.enum_for(:each_char).reduce(0) { |sum, d| sum + d.to_i }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem16.solution
end
