$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=92
class Problem
  def self.solution_1
    finish = 10_000_000
    current_solution = 0

    ignores, valids = [], []

    ignores[1] = true
    valids[89] = true

    (1..567).each do |n|
      last = n
      crt = [n]

      loop do
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

  def self.sq_digits(n)
    result = 0

    while n.positive?
      result += (n % 10) * (n % 10)
      n /= 10
    end

    result
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
