// only works on JavaScript 1.7+
function range(begin, end) {
  for (let i = begin; i <= end; ++i) {
    yield i;
  }
};

var sum_of_squares = [i*i for each(i in range(1, 100))].reduce(function(a, b) {
    return a + b;
});

var square_of_sum = Math.pow([i for each(i in range(1, 100))].reduce(function(a, b) {
  return a + b;
}), 2);

console.log(square_of_sum - sum_of_squares);
