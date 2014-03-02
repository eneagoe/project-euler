$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'divisors'

class Problem23 < Problem

  def solve

    abundants = (12..28123).select { |i| abundant?(i) }

    sums = []
    until abundants.empty?

      i = abundants.shift
      sums << i*2
      abundants.each do |j|
        sum = i + j
        break if sum > 28123
        sums << sum
      end

    end

    ((1..28123).to_a - sums).reduce(:+)

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem23.solution
end
