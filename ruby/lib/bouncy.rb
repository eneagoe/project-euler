require "digits"

def bouncy?(n)
  digit_pairs = digits(n).each_cons(2)
  increasing = digit_pairs.reduce(true) { |s, (a, b)| s && (a <= b) }
  decreasing = digit_pairs.reduce(true) { |s, (a, b)| s && (a >= b) }

  !increasing && !decreasing
end
