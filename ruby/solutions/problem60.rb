$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "prime"
require "prime_check"

# extremely ugly brute-force, within 1m limit
# Solves http://projecteuler.net/problem=60
class Problem
  class << self
    def solution_1
      primes = Prime.take_while { |p| p < 10_000 } - [2, 5]

      p1max = primes.length - 5
      p2max = p1max + 1
      p3max = p2max + 1
      p4max = p3max + 1
      p5max = p4max + 1

      (0...p1max).each do |p1|
        (p1 + 1...p2max).each do |p2|
          next unless prime_pair?(primes[p1], primes[p2])
          (p2 + 1...p3max).each do |p3|
            next if !prime_pair?(primes[p1], primes[p2]) ||
                    !prime_pair?(primes[p2], primes[p3])
            (p3 + 1...p4max).each do |p4|
              next if !prime_pair?(primes[p1], primes[p4]) ||
                      !prime_pair?(primes[p2], primes[p4]) ||
                      !prime_pair?(primes[p3], primes[p4])
              (p4 + 1...p5max).each do |p5|
                next if !prime_pair?(primes[p1], primes[p5]) ||
                        !prime_pair?(primes[p2], primes[p5]) ||
                        !prime_pair?(primes[p3], primes[p5]) ||
                        !prime_pair?(primes[p4], primes[p5])
                return primes[p1] + primes[p2] + primes[p3] +
                       primes[p4] + primes[p5]
              end
            end
          end
        end
      end
    end

    def prime_pair?(a, b)
      prime?("#{a}#{b}".to_i) && prime?("#{b}#{a}".to_i)
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
