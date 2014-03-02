$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem9 < Problem

  def solve
    (3..1000/3).each { |a|
      (a+1..(1000-a)/2).each { |b|
        c = 1000 - a - b
        return a*b*c if a**2 + b**2 == c**2
      }
    }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem9.solution
end
