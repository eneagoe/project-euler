require 'minitest/autorun'

require 'palindrome'

describe "#reverse" do
  it "should reverse an integer" do
    reverse(4).must_equal 4
    reverse(40).must_equal 4
    reverse(123).must_equal 321
    reverse(4321).must_equal 1234
  end
end

describe "#palindrome?" do

  it "should be true for palindrome numbers" do
    palindrome?(4).must_equal true
    palindrome?(212).must_equal true
    palindrome?(1001).must_equal true
  end

  it "should be false for non-palindrome numbers" do
    palindrome?(10).must_equal false
    palindrome?(1231).must_equal false
  end

end
