require "minitest/autorun"
require "bouncy"

describe "#bouncy?" do
  it "is true if the number is neither increasing nor decreasing" do
    assert !bouncy?(0)
    assert !bouncy?(1)
    assert !bouncy?(10)
    assert !bouncy?(98)
    assert bouncy?(101)
    assert bouncy?(1231)
  end
end
