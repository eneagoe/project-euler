$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem3_1 < Problem

  def solve
    # this version is not significantly slower than the regular solution.
    # transpose will 'unzip' the divisors array, and since they are already sorted,
    # we just take the last one
    Prime.prime_division(600851475143).transpose.first.last
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem3_1.solution
end
