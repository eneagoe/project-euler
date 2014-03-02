require 'minitest/autorun'

require 'divisors'

describe "#divisors" do

  it "returns the proper divisors of its argument" do
    divisors(1).must_equal []
    divisors(4).must_equal [1, 2]
    divisors(6).must_equal [1, 2, 3]
    divisors(20).must_equal [1, 2, 4, 5, 10]
    divisors(28).must_equal [1, 2, 4, 7, 14]
  end

end

describe "#perfect?" do

  it "is true if the number is perfect" do
    perfect?(6).must_equal true
    perfect?(28).must_equal true
    perfect?(496).must_equal true
    perfect?(1).must_equal false
    perfect?(12).must_equal false
  end

end

describe "#abundant?" do

  it "is true if the number is perfect" do
    abundant?(12).must_equal true
    abundant?(18).must_equal true
    abundant?(20).must_equal true
    abundant?(10).must_equal false
    abundant?(32).must_equal false
  end

end
