$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'prime'

require 'problem'
require 'arithmetic_progression'

class Problem49 < Problem

  def solve
    (1001..9997).each do |p|
      family = prime_family(p).sort
      return prime_family(p).join if p.prime? && arithmetic_progression?(family)
    end
  end

  def prime_family(n)
    n.to_s.split(//).permutation.select do |p|
      p = p.join.to_i
      p.prime? && p >= n
    end.map { |p| p.join.to_i }.uniq.sort
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem49.solution
end
