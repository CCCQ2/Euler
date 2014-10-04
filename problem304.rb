#For any positive integer n the function next_prime(n) returns the smallest prime p such that p > n.
#The sequence a(n) is defined by:
#a(1)=next_prime(10^14) and a(n)=next_prime(a(n-1)) for n>1.
#The fibonacci sequence f(n) is defined by: f(0)=0, f(1)=1 and f(n)=f(n-1)+f(n-2) for n1.
#The sequence b(n) is defined as f(a(n)).
#Find SUM b(n) for 1<=n<=100 000. Give your answer mod 1234567891011.

require "mathn"
require "memoize"
require "matrix"
include Memoize

M = Matrix[[0, 1], [1, 1]]
def next_prime(n)
	n += 1
	n += 1 while !n.prime?
	return n
end
def f(n)
	return n if n == 0 or n == 1
	lower_right(M ** (n - 1))
end
def lower_right(matrix)
	return matrix[matrix.row_size - 1, matrix.column_size - 1]
end
def a(n)
	return next_prime(1E14.to_i) if n == 1
	return next_prime(a(n-1))
end
def b(n)
	f(a(n))
end
memoize :f
memoize :next_prime


puts b(1)
puts b(2)
puts b(3)
