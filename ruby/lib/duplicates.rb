# Adds a duplicates detecting method
module Enumerable
  # fast way to detect duplicates
  def dups
    reduce({}) { |h, v| h[v] = h[v].to_i + 1; h }.reject { |k, v| v == 1 }.keys
  end
end
