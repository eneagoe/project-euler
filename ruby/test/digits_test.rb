require "minitest/autorun"
require "digits"

describe "#sorted_digits" do
  it "returns a sorted array with the digits of the argument" do
    assert sorted_digits(0) == [0]
    assert sorted_digits(1) == [1]
    assert sorted_digits(10) == [0, 1]
    assert sorted_digits(312) == [1, 2, 3]
    assert sorted_digits(9_871_234) == [1, 2, 3, 4, 7, 8, 9]
  end
end

describe "#digits" do
  it "returns an array with the digits of the argument" do
    assert digits(0) == [0]
    assert digits(1) == [1]
    assert digits(10) == [1, 0]
    assert digits(312) == [3, 1, 2]
    assert digits(9_871_234) == [9, 8, 7, 1, 2, 3, 4]
  end
end
