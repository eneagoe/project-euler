$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'digits'

class Problem52 < Problem

  def solve

    n = 1
    while true
      s = sorted_digits(n)
      break n if s == sorted_digits(2*n) && s == sorted_digits(3*n) &&
        s == sorted_digits(4*n) && s == sorted_digits(5*n) &&
        s == sorted_digits(6*n)
      n += 1
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem52.solution
end
