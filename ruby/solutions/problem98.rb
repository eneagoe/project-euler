$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "perfect_square"

# Solver for http://projecteuler.net/problem=98
# brute-force, takes almost 3 minutes
class Problem98 < Problem
  def solve
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
                     reject { |i| !perfect_square?(i) }
        # reject candidates that aren't at least in pairs
        max = [candidates.max, max].max unless candidates.length < 2
      end
    end
    max
  end
end

puts Problem98.solution if $PROGRAM_NAME == __FILE__
