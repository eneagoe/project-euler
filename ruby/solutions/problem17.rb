$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

# very ugly solution
class Problem17 < Problem

  def solve
    (1..1000).reduce(0) { |sum, n| sum += human_number(n).length }
  end

  NUMBERS_AS_STRING =
    {
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
    }

  def human_number(n)

    return "onethousand" if n == 1000
    s = ""
    if n >= 100
      s = "#{NUMBERS_AS_STRING[n / 100]}hundred"
      n %= 100
      if n != 0
        s << "and"
      end
    end
    if n != 0
      if n < 20
        s << NUMBERS_AS_STRING[n]
      else
        s << NUMBERS_AS_STRING[(n / 10)*10]
        s << NUMBERS_AS_STRING[n%10]
      end
    end

    s

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem17.solution
end
