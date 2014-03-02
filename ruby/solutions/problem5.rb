$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'gcd'

class Problem5 < Problem

  def solve
    (2..20).reduce { |s, divisor|
      s = (s % divisor == 0 && s) || (s *= ((p = gcd(s, divisor)) != 1 && p || divisor))
    }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem5.solution
end
