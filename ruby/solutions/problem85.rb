$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem85 < Problem

  def solve

    current_solution = 0
    crt = 2500000

    (1..2000).each do |m|

      new_round = true

      (1..2000).each do |n|

        count = s(m,n)
        if (2000000-count).abs < crt
          current_solution = m*n
          crt = (2000000-count).abs
          new_round = false
        else
          break unless new_round
        end

      end

    end

    current_solution

  end

  def s(m,n)
    m*(m+1)*n*(n+1)/4
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem85.solution
end
