$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=17
# very ugly solution
class Problem
  class << self
    def solution_1
      (1..1000).reduce(0) { |a, e| a + human_number(e).length }
    end

    NUMBERS_AS_STRING = {
      0 => "",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety"
    }.freeze

    def human_number(n)
      return "onethousand" if n == 1000
      s = ""

      if n >= 100
        s = "#{NUMBERS_AS_STRING[n / 100]}hundred"
        n %= 100
        s << "and" if n != 0
      end

      if n != 0
        if n < 20
          s << NUMBERS_AS_STRING[n]
        else
          s << NUMBERS_AS_STRING[(n / 10) * 10] << NUMBERS_AS_STRING[n % 10]
        end
      end

      s
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
