def triangle?(n)
  t = Math.sqrt(8 * n + 1)
  t % 1 == 0 && t.to_i.odd?
end
