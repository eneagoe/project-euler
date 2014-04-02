require "minitest/autorun"
require "perfect_square"

describe "#perfect_square?" do
  it "should be true for perfect squares" do
    perfect_square?(4).must_equal true
    perfect_square?(25).must_equal true
    perfect_square?(64).must_equal true
  end

  it "should be false for non-squares" do
    perfect_square?(10).must_equal false
    perfect_square?(17).must_equal false
  end
end
