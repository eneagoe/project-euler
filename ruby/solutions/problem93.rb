$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")

# Solves http://projecteuler.net/problem=93
class Problem
  OPERATIONS = %i[- + * /].repeated_permutation(3)
  # all the possible paranthesised expressions with 4 arguments
  TREES = ["((afb)gc)hd", "(af(bgc))hd", "(afb)g(chd)",
           "af((bgc)hd)", "af(bg(chd))"].freeze

  def self.solution_1
    (1..9).to_a.permutation(4).
      select { |a| a[0] < a[1] && a[1] < a[2] && a[2] < a[3] }.max_by do |digits|
      targets = {}
      digits.permutation.each do |a, b, c, d|
        OPERATIONS.each do |f, g, h|
          TREES.each do |tree|
            v = {}
            v["a"] = a.to_f
            v["b"] = b.to_f
            v["c"] = c.to_f
            v["d"] = d.to_f
            v["f"] = f
            v["g"] = g
            v["h"] = h
            exp = tree.gsub(/[abcdfgh]/, v)
            # TODO: very ugly, replace it with a proper evaluator
            value = eval(exp)
            targets[value] = 1 if !value.infinite? && value == value.to_i
          end
        end
      end
      targets.keys.sort.select(&:positive?).
        slice_when { |i, j| i + 1 != j }.to_a.first.length
    end.join
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
