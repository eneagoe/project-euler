require "digits"

def bouncy?(n)
  digit_pairs = digits(n).each_cons(2)
  increasing = !digit_pairs.any? { |a, b| a > b }
  decreasing = !digit_pairs.any? { |a, b| a < b }

  !increasing && !decreasing
end
