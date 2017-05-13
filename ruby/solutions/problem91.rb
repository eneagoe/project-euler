$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=91
class Problem
  def self.solution_1
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
            next unless (x1 * x2 + y1 * y2).zero? ||
                        (x1 * (x2 - x1) + y1 * (y2 - y1)).zero? ||
                        (x2 * (x1 - x2) + y2 * (y1 - y2)).zero?
            right_triangles_count += 1 # if so, we found a right triangle
          end
        end
      end
    end
    right_triangles_count / 2
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
