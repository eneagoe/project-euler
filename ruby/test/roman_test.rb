require "minitest/autorun"
require "roman"

describe "#roman_to_i" do
  it "returns the integer value of a Roman numeral" do
    assert roman_to_i("I") == 1
    assert roman_to_i("II") == 2
    assert roman_to_i("IX") == 9
    assert roman_to_i("XL") == 40
    assert roman_to_i("XC") == 90
    assert roman_to_i("XD") == 490
    assert roman_to_i("CM") == 900
    assert roman_to_i("MM") == 2000
  end
end

describe "#i_to_roman" do
  it "returns the Roman numeral equivalent of an int" do
    assert i_to_roman(1) == "I"
    assert i_to_roman(2) == "II"
    assert i_to_roman(9) == "IX"
    assert i_to_roman(40) == "XL"
    assert i_to_roman(90) == "XC"
    assert i_to_roman(900) == "CM"
    assert i_to_roman(2014) == "MMXIV"
  end
end
