#A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
#a2 + b2 = c2
#For example, 32 + 42 = 9 + 16 = 25 = 52.
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

a, b, c = 0
catch :done do
	for a in 1..1000
		for b in a..1000
			for c in b..1000
				throw :done if a**2 + b**2 == c**2 && a+b+c == 1000
			end
		end
	end
end
puts "#{a}^2 + #{b}^2 = #{c}^2  P:#{a*b*c}"