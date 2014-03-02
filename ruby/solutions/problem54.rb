$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require 'problem'

#FIXME: fast enough, but this is the ugliest solution
class Problem54 < Problem

  def solve

    @card_values = Hash.new { |h,k| h[k] = k.to_i if ("2".."9").include?(k) }.merge({ "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14})

    File.open("../support-files/poker.txt").count do |hand|

      hand = hand.split(/\s/)
      p1 = hand[0..4]
      p2 = hand[5..9]

      wins?(p1, p2)

    end

  end

  def wins?(p1, p2)

    h1 = hand_value(p1)
    h2 = hand_value(p2)

    (h1 <=> h2) == 1

  end

  def hand_value(hand)

    a = hand.map { |c| @card_values[c[0,1]] }

    a = if pair?(hand)
      a.map { |c| a.count(c) == 2 ? c*15 : c }
    elsif two_pairs?(hand)
      a.map { |c| a.count(c) == 2 ? c*15**2 : c }
    elsif three_of_a_kind?(hand)
      a.map { |c| a.count(c) == 3 ? c*15**3 : c }
    elsif straight?(hand)
      a.map { |c| c*15**4 }
    elsif flush?(hand)
      a.map { |c| c*15**5 }
    elsif full_house?(hand)
      a.map { |c| c*15**6 }
    elsif four_of_a_kind?(hand)
      a.map { |c| c*15**7 }
    elsif straight_flush?(hand)
      a.map { |c| c*15**8 }
    elsif royal_flush?(hand)
      a.map { |c| c*15**9 }
    else
      a
    end

    a.sort {|x,y| y <=> x }

  end

  def pair?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }
    a.map { |i| a.count(i) }.sort == [1,1,1,2,2]
  end

  def two_pairs?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }
    a.map { |i| a.count(i) }.sort == [1,2,2,2,2]
  end

  def three_of_a_kind?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }
    a.map { |i| a.count(i) }.uniq.sort == [1,3]
  end

  def full_house?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }
    a.map { |i| a.count(i) }.uniq.sort == [2,3]
  end

  def four_of_a_kind?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }
    a.map { |i| a.count(i) }.include?(4)
  end

  def straight?(hand)
    a = hand.map { |c| @card_values[c[0,1]] }.sort
    (0...a.size-1).reduce(true) { |v,i| v &&= a[i+1] == a[i]+1 }
  end

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def royal_flush?(hand)
    straight_flush?(hand) && hand.map { |c| @card_values[c[0,1]] }.sort[0] == 10
  end

  def flush?(hand)
    colors = hand.map { |c| c[1, 1] }
    colors.uniq.size == 1
  end

end

if $PROGRAM_NAME == __FILE__
  puts Problem54.solution
end
