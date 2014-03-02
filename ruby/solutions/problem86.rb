$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem86 < Problem

  def solve

    n, target = 10, 2000
    while true
      n += 1
      count = 0
      (1..n).each do |h|
        (h..n).each do |w|
          (w..n).each do |l|
            s = Math.sqrt(l**2 + (h+w)**2)
            count += 1 if s % 1 == 0
          end
        end
      end
      break n if count >= target
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem86.solution
end
