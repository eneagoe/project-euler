$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'fibonacci'

class Problem2 < Problem

  attr_reader :n

  def initialize
    @n = 4_000_000
  end

  def solve
    Fibonacci.take_while { |i| i < n }.select(&:even?).reduce(:+) 
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem2.solution
end
