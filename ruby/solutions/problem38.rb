$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'pandigital'

require 'set'

class Problem38 < Problem

  def solve

    pandigitals = Set.new

    (1..98765).each do |n|
      r, i = n, 2
      while r < 123456789
        r = r * 10**(Math.log10(i*n).to_i + 1) + i*n
        i += 1
      end
      pandigitals << r if pandigital?(r) unless r > 987654321
    end

    pandigitals.max

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem38.solution
end
