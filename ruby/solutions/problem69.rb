$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'prime'

class Problem69 < Problem

  def solve

    n = 1000000
    primes = Prime.lazy

    i, p, current_solution = 0, 1, 1
    while true

      p *= primes.next
      break if p >= n
      i += 1
      current_solution = p

    end

    current_solution

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem69.solution
end
