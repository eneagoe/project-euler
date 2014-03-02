$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem99 < Problem

  def solve

    File.foreach("../support-files/base_exp.txt").each_with_index.max_by do |line, i|

      a, b = line.split(/,/)
      b.to_i*Math.log(a.to_i)

    end.last + 1

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem99.solution
end
