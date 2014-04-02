require "minitest/autorun"
require "pentagonal"

describe "#pentagonal?" do
  it "is true for pentagonal numbers, false otherwise" do
    assert pentagonal?(1)
    assert !pentagonal?(4)
    assert pentagonal?(5)
    assert pentagonal?(12)
    assert pentagonal?(22)
  end
end

describe "#pentagonal" do
  it "returns the nth pentagonal number" do
    assert pentagonal(1) == 1
    assert pentagonal(2) == 5
    assert pentagonal(5) == 35
    assert pentagonal(10) == 145
  end
end
