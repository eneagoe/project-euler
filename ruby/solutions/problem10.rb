$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem10 < Problem

  def solve
    sum = 0 
    Prime.each { |i| break sum if i > 2000000; sum += i }
    # a slightly slower but more readable solution would be
    # Prime.take_while { |i| i < 2000000 }.reduce(:+)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem10.solution
end
