$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=59
class Problem
  class << self
    def solution_1
      letters = File.read("../support-files/cipher1.txt").split(",")
      letters[-1].chomp!

      # brute-force to get the key
      # ("a".."z").each do |a|
      #
      #  ("a".."z").each do |b|
      #
      #    ("a".."z").each do |c|
      #      puts "----#{a}#{b}#{c}----"
      #      key = [a.ord, b.ord, c.ord] * (letters.size/3 + 1)
      #      puts letters.zip(key).map { |ch| (ch[0].to_i ^ ch[1].ord).chr }.join
      #    end
      #
      #  end
      #
      # end

      key = ["g".ord, "o".ord, "d".ord] * (letters.size / 3 + 1)
      word_value(letters.zip(key).map { |c| (c[0].to_i ^ c[1]).chr }.join)
    end

    def word_value(s)
      s.bytes.to_a.reduce(:+)
    end
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
