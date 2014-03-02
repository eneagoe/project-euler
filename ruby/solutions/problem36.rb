$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem36 < Problem

  def solve
    # we don't need to check even numbers, in base 2 they end with 0
    (1...1000000).step(2).reduce(0) do |sum, n|
      sum += (n.to_s == n.to_s.reverse && n.to_s(2) == n.to_s(2).reverse ? n : 0)
    end
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem36.solution
end
