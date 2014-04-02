require "minitest/autorun"
require "pandigital"

describe "#pandigital?" do
  it "is true if the number is a permutation of (1..9)" do
    assert pandigital?(123_456_789)
    assert !pandigital?(123_456_788)
    assert pandigital?(87_654_321)
    assert pandigital?(3421)
    assert !pandigital?(3321)
  end
end
