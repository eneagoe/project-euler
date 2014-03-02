def digits(n)
  return [0] if n.zero?
  darr = []
  while n > 0
    n, r = n.divmod(10)
    darr.unshift r
  end
  darr
end

def sorted_digits(n)
  digits(n).sort
end
