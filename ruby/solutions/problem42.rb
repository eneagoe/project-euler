$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'triangle'

class Problem42 < Problem

  def solve
    words = File.read("../support-files/words.txt").split(",")
    words.count { |word| is_triangle?(word_value(word)) }
  end

  def word_value(s)
    s.gsub(/"/, '').each_char.reduce(0) { |sum, i| sum += (i.ord - 64) }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem42.solution
end
