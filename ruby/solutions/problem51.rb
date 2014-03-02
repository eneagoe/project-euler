$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'prime_check'
require 'problem'
require 'prime'

# brute-force, ugly
class Problem51 < Problem

  def solve

    max_size = 8

    Prime.each do |n|

      next if n < 56009
      break n if prime_family_match(n, max_size)

    end

  end

  def prime_family_match(n, max_size = 8)

    (0..9).each do |r|

      return true if (0..9).map do |d|
        c = n.to_s.tr(r.to_s, d.to_s)
        c[0,1] == "0" ? nil : c.to_i
      end.compact.select { |i| prime?(i) }.uniq.size == max_size

    end

    false

  end


end

if $PROGRAM_NAME == __FILE__
  puts Problem51.solution
end
