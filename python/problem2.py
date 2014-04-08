from itertools import takewhile
from fibonacci import *

print sum(x for x in takewhile(lambda x: x < 4000000, fibonacci()) if x % 2 == 0)
