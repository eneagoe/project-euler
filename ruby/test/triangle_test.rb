require 'minitest/autorun'
require 'triangle'

describe "#is_triangle?" do

  it "is true for triangle numbers, false otherwise" do
    assert is_triangle?(3)
    assert !is_triangle?(4)
    assert is_triangle?(6)
    assert !is_triangle?(12)
    assert is_triangle?(55)
  end

end
