require 'minitest/autorun'
require 'pandigital'

describe "#pandigital?" do
  it "is true if the number is a permutation of (1..9)" do
    assert pandigital?(123456789)
    assert !pandigital?(123456788)
    assert pandigital?(87654321)
    assert pandigital?(3421)
    assert !pandigital?(3321)
  end
end
