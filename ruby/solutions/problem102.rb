$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=102
class Problem102 < Problem
  def solve
    File.open("../support-files/triangles.txt").each_line.select do |line|
      points = line.split(/,/).map(&:to_i)
      inside_triangle?([0, 0], [points[0], points[1]],
                       [points[2], points[3]],
                       [points[4], points[5]])
    end.count
  end

  def sign(p1, p2, p3)
    (p1[0] - p3[0]) * (p2[1] - p3[1]) - (p2[0] - p3[0]) * (p1[1] - p3[1])
  end

  def inside_triangle?(pt, v1, v2, v3)
    b1 = sign(pt, v1, v2) < 0
    b2 = sign(pt, v2, v3) < 0
    b3 = sign(pt, v3, v1) < 0
    (b1 == b2) && (b2 == b3)
  end
end

puts Problem102.solution if $PROGRAM_NAME == __FILE__
