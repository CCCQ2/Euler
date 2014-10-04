
def fib(n)
	n < 2 ? n : fib(n-1) + fib(n-2)
end

def carre(n)
	n * n
end

for i in 1..25
	puts fib(i)
end