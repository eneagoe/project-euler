// only works on JavaScript 1.7+
function range(begin, end) {
  for (let i = begin; i < end; ++i) {
    yield i;
  }
};

[i for each (i in range(1, 1000)) if (i % 3 == 0 || i % 5 == 0)].reduce(function(a, b) {
    return a + b;
});
