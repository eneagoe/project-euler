Fibonacci = Enumerator.new do |yielder|
  i, j = 0, 1
  loop do
    i, j = j, i + j
    yielder.yield i
  end
end

