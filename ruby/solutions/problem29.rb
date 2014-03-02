$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'set'

class Problem29 < Problem

  def solve

    n, seq = 100, Set.new

    (2..n).each { |a|
      (2..n).each { |b|
        seq << a**b
      }
    }

    seq.size

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem29.solution
end
