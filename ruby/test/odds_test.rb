require 'minitest/autorun'

require 'odds'

describe Odds do

  it "should be an enumerator" do
    Odds.must_be_instance_of Enumerator
  end

  it "should return a sequence of odd numbers" do
    Odds.take(5).must_equal [1, 3, 5, 7, 9]
  end

end
