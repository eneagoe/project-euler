solution = head [a * b * c | a <- [3..333], b <- [a+1..((1000-a) `div` 2)], c <- [1000 - a - b], a^2 + b^2 == c^2]
