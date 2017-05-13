$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=99
class Problem
  def self.solution_1
    File.foreach("../support-files/base_exp.txt").
      each_with_index.max_by do |line, _|
      a, b = line.split(/,/)
      b.to_i * Math.log(a.to_i)
    end.last + 1
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
