$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem30 < Problem

  def solve
    powers = (0..9).map { |i| i**5 }
    (2..354294).reduce(0) { |sum, n|
      sum += (n == n.to_s.split(//).reduce(0) { |s, i| s += powers[i.to_i] } ? n : 0)
    }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem30.solution
end
