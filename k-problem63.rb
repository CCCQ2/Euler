#The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
#How many n-digit positive integers exist which are also an nth power?

solution = []

for pow in 1..100
	for num in 1..9
		solution << [num, pow] if (num**pow).to_s.size == pow
		break if (num**pow).to_s.size > pow
	end
end
p solution.count
