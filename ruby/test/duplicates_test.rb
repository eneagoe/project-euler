require "minitest/autorun"
require "duplicates"

describe "Enumerable#dups" do
  it "returns the duplicates in an Enumerable" do
    [1].dups.must_equal []
    [1, 1].dups.must_equal [1]
    [1, 2].dups.must_equal []
    [1, 1, 2, 2, 3].dups.must_equal [1, 2]
  end
end
