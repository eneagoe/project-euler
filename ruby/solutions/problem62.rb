$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'digits'

class Problem62 < Problem

  def solve

    cubes = (1..10000).map { |i| i**3 }
    cube_digits = cubes.map { |i| sorted_digits(i).join }
    counts = cube_digits.map { |d| cube_digits.count(d) }

    cubes[counts.find_index(5)]

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem62.solution
end
