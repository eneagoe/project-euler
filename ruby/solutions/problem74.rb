$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'digits'

# brute-force, extremely slow
class Problem74 < Problem

  def solve

    f = (1..9).map { |i| (1..i).reduce(:*) }.unshift 1

    (1..1000000).count do |n|

      f_chain, crt = [n], n

      while true

        s = digits(crt).reduce(0) { |sum, i| sum += f[i] }
        break if f_chain.include?(s)
        f_chain << s
        break if f_chain.size > 60
        crt = s

      end

      f_chain.size == 60

    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem74.solution
end
