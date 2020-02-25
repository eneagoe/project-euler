n = 999

k = div(n, 3)

sum = div(3 * k * (k + 1), 2)
k = div(n, 5)

sum = sum + div(5 * k * (k + 1), 2)

k = div(n, 15)

sum = sum - div(15 * k * (k + 1 ), 2)

IO.puts(sum)
