$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"

# Solver for http://projecteuler.net/problem=84
class Problem84 < Problem
  def solve # rubocop:disable MethodLength, CyclomaticComplexity
    samples = 2_000_000
    position = 0
    stats = (0..39).map { |i| 0 }
    cc = [2, 17, 33]
    ch = [7, 22, 36]
    chest = [0, 10, false, false, false, false, false, false, false, false,
             false, false, false, false, false, false]
    chance = [0, 10, 11, 24, 39, 5, "R", "R", "U", -3, false, false, false,
              false, false, false]
    doubles = 0

    # run simulation, compute stats
    (1..samples).each do |sample|
      d1, d2 = roll_dice, roll_dice

      if d1 == d2
        doubles += 1
        if doubles == 3
          position = 10
          stats[position] += 1
          doubles = 0
          next
        end
      else
        doubles = 0
      end

      position = (position + (d1 + d2)) % 40

      if position == 30
        position = 10
        stats[position] += 1
        next
      end

      if cc.include?(position)
        card = chest.sample
        if card
          stats[card] += 1
          position = card
          next
        end
      end

      if ch.include?(position)
        card = chance.sample
        if card
          position = new_position(card, position)
          stats[position] += 1
          next
        end
      end

      stats[position] += 1
    end

    # compute results and display
    sol = {}
    stats.map { |s| (s.to_f / samples) * 100 }.
      each_with_index { |s, i| sol[i] = s }
    sol = sol.sort_by { |k, v| v }.last(3).reverse
    sol.map { |i| i[0] }.join
  end

  # rubocop:disable CyclomaticComplexity
  def new_position(card, position)
    if card == "U"
      position == 22 ? 28 : 12
    elsif card == "R"
      if position == 7
        15
      else
        position == 22 ? 25 : 5
      end
    elsif card < 0
      (position + card) % 40
    else
      card
    end
  end

  def roll_dice
    [1, 2, 3, 4].sample
  end
end

puts Problem84.solution if $PROGRAM_NAME == __FILE__
