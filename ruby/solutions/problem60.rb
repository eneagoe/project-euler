$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'prime'
require 'problem'
require 'prime_check'

# extremely ugly brute-force
class Problem60 < Problem

  def solve

    primes = Prime.take_while { |p| p < 10000 } - [2, 5]

    p1max = primes.length-5
    p2max = p1max + 1
    p3max = p2max + 1
    p4max = p3max + 1
    p5max = p4max + 1

    (0...p1max).each do |p1|

      (p1+1...p2max).each do |p2|

        next if !prime_pair?(primes[p1], primes[p2])
        (p2+1...p3max).each do |p3|

          next if !prime_pair?(primes[p1], primes[p2]) || !prime_pair?(primes[p2], primes[p3])

          (p3+1...p4max).each do |p4|

            next if !prime_pair?(primes[p1], primes[p4]) || !prime_pair?(primes[p2], primes[p4]) || !prime_pair?(primes[p3], primes[p4])

            (p4+1...p5max).each do |p5|

              next if !prime_pair?(primes[p1], primes[p5]) || !prime_pair?(primes[p2], primes[p5]) || !prime_pair?(primes[p3], primes[p5]) ||
                !prime_pair?(primes[p4], primes[p5])
                return primes[p1] + primes[p2] + primes[p3] + primes[p4] + primes[p5]

            end
          end
        end
      end
    end

  end

  def prime_pair?(a,b)
    prime?("#{a}#{b}".to_i) && prime?("#{b}#{a}".to_i)
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem60.solution
end
