$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem92 < Problem

  def solve

    finish = 10_000_000
    current_solution = 0
    @s = (0..9).map { |i| i**2 }

    ignores, valids = [], []

    ignores[1] = true
    valids[89] = true

    (1..567).each do |n|

      last = n
      crt = [n]

      while true

        last = sq_digits(last)
        if last == 1 || ignores[last]
          crt.each { |i| ignores[i] = true }
          break
        end

        if last == 89 || valids[last]

          crt.each { |i| valids[i] = true }
          current_solution += 1
          break

        end

        crt << last

      end

    end

    (568..finish).each do |n|
      current_solution += 1 if valids[sq_digits(n)]
    end

    current_solution

  end


  def sq_digits(n)

    result = 0

    while n > 0 do
      result += (n%10)*(n%10)
      n /= 10
    end

    result

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem92.solution
end
