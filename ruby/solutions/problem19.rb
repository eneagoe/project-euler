$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'date'

class Problem19 < Problem

  def solve
    (1901..2000).reduce(0) do |result, year|
      result += (1..12).reduce(0) { |sum, month| sum += (Date.new(year, month, 1).wday == 0 ? 1 : 0) }
    end
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem19.solution
end
