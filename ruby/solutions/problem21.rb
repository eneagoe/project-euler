$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'divisors'

class Problem21 < Problem

  def solve

    amicable = []
    (2..10000).each do |i|

      a = divisors_sum(i)
      b = divisors_sum(a)

      if b == i && a != i
        amicable += [i, a]
      end

    end

    amicable.uniq.reduce(:+)

  end

  def divisors_sum(n)
    divisors(n).reduce(:+)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem21.solution
end
