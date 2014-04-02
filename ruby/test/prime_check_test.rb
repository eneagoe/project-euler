require "minitest/autorun"
require "prime_check"

describe "#prime?" do
  it "should be true for prime numbers" do
    prime?(3).must_equal true
    prime?(13).must_equal true
    prime?(31).must_equal true
  end

  it "should be false for composite numbers" do
    prime?(4).must_equal false
    prime?(14).must_equal false
    prime?(30).must_equal false
  end
end
