$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem22 < Problem

  def solve
    File.read("../support-files/names.txt").split(",").
      sort.
      each_with_index.map { |name, i| (i + 1) * alpha_value(name) }.
      reduce(:+)
  end

  def alpha_value(s)
    s.gsub(/"/, '').bytes.reduce(0) { |sum, i| sum += (i.ord - 64) }
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem22.solution
end
