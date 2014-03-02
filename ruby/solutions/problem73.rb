$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem73 < Problem

  def solve

    d = 12000

    (1..d-1).map do |i|

      (i+1..d).count do |n|

        r = i.to_f/n.to_f
        if 1/3.0 < r && 1/2.0 > r
          Rational(i, n).denominator >= n
        end

      end

    end.reduce(:+)

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem73.solution
end
