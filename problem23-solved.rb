#A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require "prime"

class Integer
	def factors
		(1..self-1).select{ |n| (self % n).zero? }
	end
	def abundant?
		self.factors.reduce(:+).to_i > self.to_i
	end
end

abundant = []
solution = []
for num in 1..28123
	if num.abundant?
		abundant << num
	end
end

for num in 1..28123
	catch (:done) do
		abundant.select{|n| n < num}.each do |sum1|
			abundant.select{|n| n < num}.each do |sum2|
				throw :done if num == sum1 + sum2
			end
		end
		puts "Impossible: #{num}"
		solution << num
		throw :done
	end
end
puts solution.inject(:+)
