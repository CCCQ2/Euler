# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, {24,45,51}, {30,40,50}

# For which value of p ≤ 1000, is the number of solutions maximised?

max = 0
for p in 1..1000

	#Find combinations obeying right angle with integral length -- c**2 = a**2 + b**2
	combinations = []
	for c in 1..p
		for b in 1..(p-c)
			a = p - c - b
			if c ** 2 == a ** 2 + b ** 2 && a + b + c == p && a > 0 && b > 0 && c > 0
				combinations << [a, b, c]
				#puts "Perimeter #{p} : #{c}^2 = #{a}^2 + #{b}^2 -- #{a} + #{b} + #{c}"
			end
		end
	end
	count = combinations.count / 2
	if count > max
		max = count
		puts "New max set with #{p} -- #{count} total combinations."
	end

end