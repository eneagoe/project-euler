$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=91
class Problem91 < Problem
  def solve
    n = 50
    right_triangles_count = 0
    (0..n).each do |x1|
      (0..n).each do |y1|
        next if [x1, y1] == [0, 0] # skip origin
        (0..n).each do |x2|
          (0..n).each do |y2|
            # skip origin or other point
            next if [x2, y2] == [x1, y1] || [x2, y2] == [0, 0]
            # are any two vectors perpendicular?
            if x1*x2 + y1*y2 == 0 || x1*(x2-x1) + y1*(y2-y1) == 0 ||
               x2*(x1-x2) + y2*(y1-y2) == 0
              right_triangles_count += 1 # if so, we found a right triangle
            end
          end
        end
      end
    end
    right_triangles_count / 2
  end
end

puts Problem91.solution if $PROGRAM_NAME == __FILE__
