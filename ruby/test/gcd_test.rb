require 'minitest/autorun'

require 'gcd'

describe "#gcd" do
  it "should return the greatest common divisor" do
    gcd(4, 8).must_equal 4
    gcd(12, 8).must_equal 4
    gcd(13, 7).must_equal 1
    gcd(21, 4).must_equal 1
  end
end
