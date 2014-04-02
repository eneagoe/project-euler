$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "set"
require "tsort"

# Utility method for topologically sorting a hash
class Hash
  include TSort
  alias_method :tsort_each_node, :each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block) if key?(node)
  end
end

# Solver for http://projecteuler.net/problem=79
class Problem79 < Problem
  def solve
    h = Hash.new { |hash, key| hash[key] = Set.new }
    IO.readlines("../support-files/keylog.txt").each do |line|
      (v1, v2, v3) = line.split(//)
      h[v1] << v2 << v3
      h[v2] << v3
    end
    h.tsort.reverse.join
  end
end

puts Problem79.solution if $PROGRAM_NAME == __FILE__
