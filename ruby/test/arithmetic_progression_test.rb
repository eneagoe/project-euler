require 'minitest/autorun'
require 'arithmetic_progression'

describe "#arithmetic_progression?" do

  it "is true if the array passed as argument is an arithmetic progression" do
    assert !arithmetic_progression?([1])
    assert !arithmetic_progression?([1, 2])
    assert arithmetic_progression?([1, 2, 3])
    assert !arithmetic_progression?([1, 2, 4])
    assert arithmetic_progression?([10, 20, 30, 40])
    assert !arithmetic_progression?([10, 20, 30, 41])
  end

end
