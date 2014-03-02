require 'minitest/autorun'
require 'number_rotations'

describe "#rotations" do
  it "returns all the possible rotations of its argument" do
    rotations(1).must_equal [1]
    rotations(10).must_equal [1, 10]
    rotations(13).must_equal [31, 13]
    rotations(197).must_equal [719, 971, 197]
    rotations(1234).must_equal [4123, 3412, 2341, 1234]
  end
end
