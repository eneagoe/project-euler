$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "perfect_square"

# Solves http://projecteuler.net/problem=98
# brute-force, takes too long (~ 3m)
class Problem
  def self.solution_1
    max = 0
    # find all anagram sets in the file
    anagrams = File.read("../support-files/p098_words.txt").split(",").
               group_by { |w| w.delete('"').split(//).sort }.
               select { |_w, a| a.length >= 2 }
    anagrams.each do |w, words|
      # try every possible digit arrangement for the current anagram set
      (0..9).to_a.permutation(w.uniq.length).each do |sub|
        pair = w.uniq.zip(sub).to_h
        candidates = words.map { |wd| wd.split(//).map { |c| pair[c] }.join }.
                     reject { |word| word.start_with? "0" }.map(&:to_i).
                     select { |i| perfect_square?(i) }
        # reject candidates that aren't at least in pairs
        max = [candidates.max, max].max unless candidates.length < 2
      end
    end
    max
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
