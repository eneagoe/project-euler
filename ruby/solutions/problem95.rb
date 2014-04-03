$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "divisors"
require "rgl/adjacency"
require "rgl/connected_components"

# Solver for http://projecteuler.net/problem=95
# works, but it's extremely slow (~8m)
class Problem95 < Problem
  def solve
    n = 1_000_000
    dg = RGL::DirectedAdjacencyGraph[]
    (1..n).each do |i|
      sum = divisors(i).reduce(:+) || 0
      dg.add_edges [i, sum] if sum < n
    end
    # find all the cycles in the graph, take the longest one
    # and choose the minimum element
    inv_comp_map = {}
    dg.strongly_connected_components.comp_map.each do |v, i|
      (inv_comp_map[i] ||= []) << v
    end
    inv_comp_map.values.delete_if { |scc| scc.size == 1 }.
      max_by { |c| c.length }.min
  end
end

puts Problem95.solution if $PROGRAM_NAME == __FILE__
