$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=102
class Problem
  def self.solution_1
    File.open("../support-files/triangles.txt").each_line.select do |line|
      points = line.split(/,/).map(&:to_i)
      inside_triangle?([0, 0], [points[0], points[1]],
                       [points[2], points[3]],
                       [points[4], points[5]])
    end.count
  end

  def self.sign(p1, p2, p3)
    (p1[0] - p3[0]) * (p2[1] - p3[1]) - (p2[0] - p3[0]) * (p1[1] - p3[1])
  end

  def self.inside_triangle?(pt, v1, v2, v3)
    b1 = sign(pt, v1, v2).negative?
    b2 = sign(pt, v2, v3).negative?
    b3 = sign(pt, v3, v1).negative?
    (b1 == b2) && (b2 == b3)
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
