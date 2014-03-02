$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'
require 'bouncy'

# brute-force
class Problem112 < Problem

  def solve

    bouncies, i = 0, 1
    while true
      bouncies += 1 if bouncy?(i)
      break i if bouncies/i.to_f == 0.99
      i += 1
    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem112.solution
end
