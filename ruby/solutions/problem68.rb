$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# very ugly solution - brute-force to find the magic rings
# Solves http://projecteuler.net/problem=68
class Problem
  def self.solution_1
    current_solution = 0
    (1..10).to_a.permutation.each do |p|
      new_sum = magic_sum(p)
      current_solution = new_sum if new_sum > current_solution
    end

    current_solution
  end

  def self.magic_sum(p)
    s = []
    a = [p[0], p[1], p[2]]
    b = [p[3], p[2], p[4]]
    c = [p[5], p[4], p[7]]
    d = [p[6], p[7], p[8]]
    e = [p[9], p[8], p[1]]
    m = [p[0], p[3], p[5], p[6], p[9]].min

    if (a.reduce(:+) == b.reduce(:+)) && (a.reduce(:+) == c.reduce(:+)) &&
       (a.reduce(:+) == d.reduce(:+)) && (a.reduce(:+) == e.reduce(:+))
      s = if m == p[0]
            [a, b, c, d, e]
          elsif m == p[3]
            [b, c, d, e, a]
          elsif m == p[5]
            [c, d, e, a, b]
          elsif m == p[6]
            [d, e, a, b, c]
          else
            [e, a, b, c, d]
          end
      s = s.join
      if s.length == 16
        s.to_i
      else
        0
      end
    else
      0
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
