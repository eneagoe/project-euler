$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'memoize'

include Memoize

class Problem72 < Problem

  def solve
    memoize :phi
    phi(1000000) - 2
  end

  def phi(n)
    n*(n+3)/2 - (2..n).reduce(0) { |sum, k| sum += phi(n/k) }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem72.solution
end
