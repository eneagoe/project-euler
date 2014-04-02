require "minitest/autorun"
require "divisor_function"

describe "#count_divisors" do
  it "should return the number of divisors of its argument" do
    count_divisors(1).must_equal 1
    count_divisors(5).must_equal 2
    count_divisors(6).must_equal 4
    count_divisors(10).must_equal 4
    count_divisors(28).must_equal 6
  end
end
