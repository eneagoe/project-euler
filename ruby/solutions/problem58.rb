$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime_check'

class Problem58 < Problem

  def solve

    primes = 0
    n = 3

    while true

      primes += 1 if prime?((n - 1)**2 + 1)
      primes += 1 if prime?(n*n - n + 1)
      primes += 1 if prime?(n*n - 3*n + 3)

      percentage = primes.to_f/(2*n - 1).to_f
      break n if percentage < 0.1

      n += 2

    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem58.solution
end
