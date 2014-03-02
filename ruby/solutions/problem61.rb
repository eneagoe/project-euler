$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

class Problem61 < Problem

  def solve

    @squares = (10..150).map { |i| i**2 }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @triangles = (10..150).map { |i| i*(i+1)/2 }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @pentagons = (10..150).map { |i| i*(3*i-1)/2 }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @hexagons = (10..150).map { |i| i*(2*i-1) }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @heptagons = (10..150).map { |i| i*(5*i-3)/2 }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @octogons = (10..150).map { |i| i*(3*i-2) }.reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }

    sets = [@squares, @triangles, @pentagons, @hexagons, @heptagons, @octogons]
    @nr = sets.flatten.uniq.sort

    found = {}

    @nr.each do |root|

      routes = [[root]]

      1.upto(5) do

        routes = routes.map do |r|
          subset(r[-1]).map { |i| [r, i].flatten }
        end.flatten(1)

      end

      routes.each do |route|

        if valid?(route)
          r = route.sort
          if found.keys.include?(r)
            found[r] += 1
          else
            found[r] = 1
          end
        end

      end

    end

    found.keys.reject { |a| sets.map { |i| i&a }.sort.uniq.size != 6 }.flatten.reduce(:+)

  end

  def subset(n)
    @nr.select { |i| (n % 100)*100 <= i && (n % 100 + 1)*100 > i && i != n }
  end

  def valid?(route)
    !(route&@squares).empty? && !(route&@triangles).empty? && !(route&@pentagons).empty? && !(route&@hexagons).empty? && !(route&@octogons).empty? &&
        !(route&@heptagons).empty? &&
      route[-1] % 100 == route[0]/100
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem61.solution
end
