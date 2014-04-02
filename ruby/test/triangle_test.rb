require "minitest/autorun"
require "triangle"

describe "#triangle?" do
  it "is true for triangle numbers, false otherwise" do
    assert triangle?(3)
    assert !triangle?(4)
    assert triangle?(6)
    assert !triangle?(12)
    assert triangle?(55)
  end
end
