$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem81 < Problem

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

    (0..len).each do |i|
      (0..len).each do |j|
        dist[[i,j]] = Float::INFINITY
        previous[[i,j]] = []
        q[[i,j]] = dist[[i,j]]
      end
    end

    dist[[0,0]] = 0
    q[[0,0]] = 0

    until q.empty?

      u = q.sort { |a,b| a[1] <=> b[1] }.first[0]

      break if dist[u] == Float::INFINITY
      if u == [len, len]
        # finished

        s = []
        u = [len, len]
        until previous[u].empty?
          s << u
          u = previous[u]
        end
        s = [[0, 0]] + s.reverse
        return s.map { |v| m[v[0]][v[1]]}.reduce(:+)
      end

      q.delete(u)
      [[u[0] + 1, u[1]], [u[0], u[1] + 1]].each do |neighbor|

        next if neighbor[0] > len || neighbor[1] > len

        alt = dist[u] + (m[u[0]][u[1]] + m[neighbor[0]][neighbor[1]])

        if alt < dist[neighbor]
          dist[neighbor] = alt
          q[neighbor] = alt
          previous[neighbor] = u
        end

      end

    end

  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem81.solution
end
