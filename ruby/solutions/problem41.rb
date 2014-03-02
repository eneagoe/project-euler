$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem41 < Problem

  def solve

    solution = 0

    (4..7).each { |i|
      (1..i).to_a.permutation.each { |p|
        n = p.join.to_i
        solution = n if (solution < n) && n.prime?
      }
    }
    solution

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem41.solution
end
