Odds = Enumerator.new do |yielder|
  i = 1
  loop do
    yielder.yield i
    i += 2
  end
end
