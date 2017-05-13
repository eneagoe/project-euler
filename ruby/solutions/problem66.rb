$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=66
# Pell equation
class Problem
  def self.solution_1
    max, current_solution = 0, 0

    (1..1000).each do |d|
      omega_0 = Math.sqrt(d)
      next if omega_0 % 1 == 0

      a = [(q = omega_0.floor)]
      p = d - q**2
      omega = 1 / (omega_0 - q)
      i = 0

      while (c = Rational(1, a[i]); j = i; while (j -= 1) >= 0 do; c = 1 / (a[j] + c); end; (c.denominator)**2 - d * (c.numerator)**2 != 1)
        a[(i += 1)] = omega.floor
        q = p * a[i] - q
        p = (d - q**2) / p
        omega = (omega_0 + q) / p
      end

      current_solution, max = d, c.numerator if c.numerator > max
    end

    current_solution
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
