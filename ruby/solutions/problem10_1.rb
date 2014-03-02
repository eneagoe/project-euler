$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime_check'

class Problem10_1 < Problem

  def solve
    # slightly faster than using Ruby's prime generator
    (2..2_000_000).select { |i| prime?(i) }.reduce(:+)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem10_1.solution
end
