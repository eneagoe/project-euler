$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'palindrome'

class Problem55 < Problem

  def solve
    (1..10000).count { |i| lychrel?(i) }
  end

  def lychrel?(n)

    (1..50).each { |i|
      n += reverse(n)
      return false if palindrome?(n)
    }

    true

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem55.solution
end
