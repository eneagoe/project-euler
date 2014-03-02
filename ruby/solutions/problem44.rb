$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'pentagonal'

# brute-force, ugly
class Problem44 < Problem

  def solve

    j, solution = 1, 0

    while true

      pj = pentagonal(j)
      (1..j).each do |k|

        pk = pentagonal(k)
        (solution = pj - pk) && break if is_pentagonal?(pj - pk) && is_pentagonal?(pj + pk)

      end

      return solution if solution != 0
      j += 1

    end

    solution

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem44.solution
end
