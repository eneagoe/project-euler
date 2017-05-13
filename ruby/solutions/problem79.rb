$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "set"
require "tsort"

# Utility method for topologically sorting a hash
class Hash
  include TSort

  alias tsort_each_node each_key

  def tsort_each_child(node, &block)
    fetch(node).each(&block) if key?(node)
  end
end

# Solves http://projecteuler.net/problem=79
class Problem
  def self.solution_1
    h = Hash.new { |hash, key| hash[key] = Set.new }
    IO.readlines("../support-files/keylog.txt").each do |line|
      (v1, v2, v3) = line.split(//)
      h[v1] << v2 << v3
      h[v2] << v3
    end
    h.tsort.reverse.join
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
