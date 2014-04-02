require "minitest/autorun"
require "fibonacci"

describe Fibonacci do
  it "should be an enumerator" do
    Fibonacci.must_be_instance_of Enumerator
  end

  it "should return a Fibonacci sequence" do
    Fibonacci.take(5).must_equal [1, 1, 2, 3, 5]
  end
end
