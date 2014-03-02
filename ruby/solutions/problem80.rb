$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'bigdecimal'
require 'bigdecimal/math'

class Problem80 < Problem

  include BigMath

  def solve

    (1..100).reduce(0) do |sum, n|
      if Math.sqrt(n) % 1 == 0
        sum
      else
        root = sqrt(BigDecimal.new(n.to_s), 100)
        # the first digit is 0, followed by a decimal dot
        root_sum = root.to_s[2,100].split(//).reduce(0) { |s,d| s += d.to_i }
        sum += root_sum
      end
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem80.solution
end
