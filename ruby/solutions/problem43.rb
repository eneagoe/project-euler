$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

# brute-force, very ugly
class Problem43 < Problem

  def solve

    (0..9).to_a.permutation.select { |p|
      p = p.join
      p[1..3].to_i.even? && (p[2..4].to_i % 3 == 0) && (p[3..5].to_i % 5 == 0) &&
        (p[4..6].to_i % 7 == 0) && (p[5..7].to_i % 11 == 0) && (p[6..8].to_i % 13 == 0) &&
          (p[7..9].to_i % 17 == 0)
    }.reduce(0) { |sum, p|
      sum += p.join.to_i
    }

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem43.solution
end
