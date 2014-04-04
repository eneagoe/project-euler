$LOAD_PATH.unshift(File.dirname(__FILE__) + "/../lib")
require "problem"
require "active_support/core_ext"

# Solver for http://projecteuler.net/problem=96
class Problem96 < Problem
  attr_reader :cells, :rows, :peers

  def initialize
    @cells = ("A".."I").to_a.product((1..9).to_a).map(&:join)
    @rows = (1..9).map { |i| ("A".."I").to_a.product([i]).map(&:join) }
    cols = ("A".."I").map { |i| [i].product((1..9).to_a).map(&:join) }
    boxes = [%w(A B C), %w(D E F), %w(G H I)].map do |u|
      [[1, 2, 3], [4, 5, 6], [7, 8, 9]].map do |v|
        u.product(v).map(&:join)
      end
    end.flatten(1)
    @peers = {}
    @cells.each do |c|
      @peers[c] = (rows + cols + boxes).select { |u| u.include?(c) }.
        flatten.uniq - [c]
    end
  end

  def solve
    sum = 0
    sudokus = File.readlines("../support-files/sudoku.txt")
    idx = 0
    while idx * 10 < sudokus.length
      grid_solution = solve_grid(grid_at(sudokus, idx))
      puts "Solution #{idx + 1}"
      display(grid_solution)
      sum += grid_solution.values_at("A1", "B1", "C1").join.to_i
      idx += 1
    end
    sum
  end

  def grid_at(sudokus, idx)
    start = sudokus[idx * 10 + 1..idx * 10 + 9].map { |l| l.chomp.split(//) }
    grid = {}
    cells.each { |c| grid[c] = ("1".."9").to_a }
    rows.zip(start).map do |(row, init)|
      row.zip(init).each do |cell, value|
        if value != "0"
          grid[cell] = [value]
          grid = eliminate(grid.deep_dup, cell, value)
        end
      end
    end
    grid
  end

  def solve_grid(grid)
    return false unless grid
    return grid if grid.all? { |k, v| v.size == 1 }
    candidate = cells.select { |c| grid[c].size > 1 }.
      sort_by { |l| l.size }.first
    grid[candidate].find do |potential|
      new_grid = solve_grid assign(grid.deep_dup, candidate, potential)
      return new_grid if new_grid
    end
  end

  def assign(grid, candidate, potential)
    grid[candidate] = [potential]
    return false if peers[candidate].any? { |c| grid[c] == [potential] }
    grid = eliminate(grid.deep_dup, candidate, potential)
    return false if cells.any? { |c| grid[c].size == 0 }
    cells.select { |cell| grid[cell].size == 1 }.each do |cell|
      return false if peers[cell].any? { |u| grid[u] == grid[cell] }
    end
    grid
  end

  def eliminate(grid, cell, value)
    peers[cell].each { |p| grid[p] = grid[p] - [value] }
    grid
  end

  def display(grid)
    (1..9).each do |c|
      ("A".."I").each do |r|
        print grid["#{r}#{c}"].join
      end
      print "\n"
    end
  end
end

puts Problem96.solution if $PROGRAM_NAME == __FILE__
