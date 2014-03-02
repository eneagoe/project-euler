def arithmetic_progression?(arr)
  return false if arr.size < 3
  d = arr[1] - arr[0]
  i = 1
  i += 1 while i < arr.size - 1 && arr[i+1] - arr[i] == d
  return i == arr.size - 1
end

