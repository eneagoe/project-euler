$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "date"

# Solves http://projecteuler.net/problem=19
class Problem
  class << self
    def solution_1
      (1901..2000).reduce(0) { |a, e| a + months_sum(e) }
    end

    def solution_2
      (1901..2000).reduce(0) do |result, year|
        result +
          (1..12).select { |month| day_of_week(year, month, 1).zero? }.size
      end
    end

    # Tomohiko Sakamoto algorithm
    def day_of_week(year, month, day)
      t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4]
      year -= 1 if month < 3
      (year + year / 4 - year / 100 + year / 400 + t[month - 1] + day) % 7
    end

    def months_sum(year)
      (1..12).select { |m| Date.new(year, m, 1).wday.zero? }.size
    end
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
