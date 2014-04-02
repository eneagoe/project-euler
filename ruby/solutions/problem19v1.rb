$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=19
class Problem19v1 < Problem
  def solve
    (1901..2000).reduce(0) do |result, year|
      result + (1..12).reduce(0) do |sum, month|
        sum + (day_of_week(year, month, 1) == 0 ? 1 : 0)
      end
    end
  end

  # Tomohiko Sakamoto algorithm
  def day_of_week(year, month, day)
    t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
    year -= 1 if month < 3
    (year + year / 4 - year / 100 + year / 400 + t[month - 1] + day) % 7
  end
end

puts Problem19v1.solution if $PROGRAM_NAME == __FILE__
