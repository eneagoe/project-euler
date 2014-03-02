$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem5_1 < Problem

  def solve
    # get the prime factorization of every number, and multiply each factor to the highest power
    (2..20).map { |i| Prime.prime_division(i) }.flatten(1).sort.reverse.uniq { |i| i[0] }.map { |i| i[0]**i[1] }.reduce(:*)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem5_1.solution
end
