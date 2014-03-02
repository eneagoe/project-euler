$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

# brute-force, extremely slow
class Problem39 < Problem

  def solve

    (0..1000).map do |p|

      solutions = 0
      (1..p-2).each do |c|
        (1..p-c-1).each do |b|
          a = p - c - b
          solutions += 1 if (c*c == a*a + b*b)
        end
      end

      solutions

    end.each_with_index.max[1]

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem39.solution
end
