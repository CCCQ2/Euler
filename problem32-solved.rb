#We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

class String
	def pandigital?
		!self.match(/^(?!.*([1-9]).*\1)[1-9]{9}$/).nil?
	end
end

solution = []
for a in 1..1E4
	for b in 2..1E3
		c = a*b
		if (a.to_s + b.to_s + c.to_s).pandigital?
			puts "#{a} * #{b} = #{c}"
			solution << c
		end
		break if c > 9999
	end
end
p solution.uniq!.reduce(:+)
