$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=61
class Problem
  def self.solution_1
    @squares = (10..150).map { |i| i**2 }.
               reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @triangles = (10..150).map { |i| i * (i + 1) / 2 }.
                 reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @pentagons = (10..150).map { |i| i * (3 * i - 1) / 2 }.
                 reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @hexagons = (10..150).map { |i| i * (2 * i - 1) }.
                reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @heptagons = (10..150).map { |i| i * (5 * i - 3) / 2 }.
                 reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }
    @octogons = (10..150).map { |i| i * (3 * i - 2) }.
                reject { |i| i > 9999 || i < 1000 }.reject { |i| i % 100 < 10 }

    sets = [@squares, @triangles, @pentagons, @hexagons, @heptagons, @octogons]
    @nr = sets.flatten.uniq.sort

    found = {}

    @nr.each do |root|
      routes = [[root]]

      1.upto(5) do
        routes = routes.flat_map do |r|
          subset(r[-1]).map { |i| [r, i].flatten }
        end
      end

      routes.each do |route|
        next unless valid?(route)
        r = route.sort
        if found.keys.include?(r)
          found[r] += 1
        else
          found[r] = 1
        end
      end
    end

    found.keys.select { |a| sets.map { |i| i & a }.sort.uniq.size == 6 }.
      flatten.reduce(:+)
  end

  def self.subset(n)
    @nr.select do |i|
      (n % 100) * 100 <= i && (n % 100 + 1) * 100 > i && i != n
    end
  end

  def self.valid?(route)
    !(route & @squares).empty? && !(route & @triangles).empty? &&
      !(route & @pentagons).empty? && !(route & @hexagons).empty? &&
      !(route & @octogons).empty? && !(route & @heptagons).empty? &&
      route[-1] % 100 == route[0] / 100
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
