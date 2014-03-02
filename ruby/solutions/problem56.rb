$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'digits'

class Problem56 < Problem

  def solve
    (1..100).map { |a| (1..100).map { |b| digits(a**b).reduce(:+) }.max }.max
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem56.solution
end
