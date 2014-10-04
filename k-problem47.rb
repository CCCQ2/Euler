#The first two consecutive numbers to have two distinct prime factors are:
#14 = 2 x 7
#15 = 3 x 5
#The first three consecutive numbers to have three distinct prime factors are:
#644 = 2² x 7 x 23
#645 = 3 x 5 x 43
#646 = 2 x 17 x 19
#Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?

require "prime"
solution = []
1.upto(1E7) do |num|
	if num.prime_division.length == 4
		solution << num
		if solution.length == 4
			puts solution.inspect
			break
		end
	else
		solution.clear
	end
end