$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem34 < Problem

  def solve

    # precompute the factorials
    facts = [1] + (1..9).map { |n| (1..n).reduce(:*) }

    (1..999999).map do |n|
      r, s = n, 0
      r, s = r/10, (s + facts[r % 10]) while r != 0
      s == n ? n : 0
    end.reduce(:+) - 3 # substract 1 and 2, they are not sums

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem34.solution
end
