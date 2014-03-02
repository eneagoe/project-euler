$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

# brute-force Dijkstra is too slow
class Problem82 < Problem

  def solve

    m = Array.new(80, Array.new)

    File.open("../support-files/matrix.txt", "r") do |f|

      f.each_with_index do |line, index|
        m[index] = line.split(/,/).map { |n| n.to_i }
      end

    end

    len = m.size - 1
    dist = {}
    previous = {}
    q = {}
    minims = []

    (0..len).each do |col|

      (0..len).each do |i|
        (0..len).each do |j|
          dist[[i,j]] = Float::INFINITY
          previous[[i,j]] = []
          q[[i,j]] = dist[[i,j]]
        end
      end

      dist[[col,0]] = 0
      q[[col,0]] = 0

      until q.empty?

        u = q.sort { |a,b| a[1] <=> b[1] }.first[0]

        break if dist[u] == Float::INFINITY
        if u[1] == len
          # finished
          s = []
          until previous[u].empty?
            s << u
            u = previous[u]
          end
          s = [[col, 0]] + s.reverse
          minims[col] = s.map { |v| m[v[0]][v[1]]}.reduce(:+)
          break
        end

        q.delete(u)
        [[u[0] + 1, u[1]], [u[0], u[1] + 1], [u[0] - 1, u[1]]].each do |neighbor|

          next if neighbor[0] > len || neighbor[1] > len || neighbor[0] < 0

          alt = dist[u] + (m[u[0]][u[1]] + m[neighbor[0]][neighbor[1]])

          if alt < dist[neighbor]
            dist[neighbor] = alt
            q[neighbor] = alt
            previous[neighbor] = u
          end

        end

      end

    end

    minims.min

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem82.solution
end
