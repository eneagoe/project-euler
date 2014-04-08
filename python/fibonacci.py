def fibonacci():
    i, j = 0, 1
    while True:
        i, j = j, i + j
        yield i
