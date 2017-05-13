$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "divisors"
require "rgl/adjacency"
require "rgl/connected_components"

# Solves http://projecteuler.net/problem=95
# works, but it's extremely slow, just under the 1m limit
class Problem
  def self.solution_1
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
    inv_comp_map.values.delete_if { |scc| scc.size == 1 }.max_by(&:length).min
  end
end

if $PROGRAM_NAME == __FILE__
  solution = if ARGV[0]
               Problem.public_send("solution_#{ARGV[0]}")
             else
               Problem.solution_1
             end
  puts solution
end
