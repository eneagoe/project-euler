def solution():
    """Solves https://projecteuler.net/problem=3"""
    n, f = 600851475143, 2
    while n != f:
        if n % f == 0:
            n /= f
        else:
            f += 1
    return n

print solution()
