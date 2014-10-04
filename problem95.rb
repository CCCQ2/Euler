#The proper divisors of a number are all the divisors excluding the number itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the sum of these divisors is equal to 28, we call it a perfect number.
#Interestingly the sum of the proper divisors of 220 is 284 and the sum of the proper divisors of 284 is 220, forming a chain of two numbers. For this reason, 220 and 284 are called an amicable pair.
#Perhaps less well known are longer chains. For example, starting with 12496, we form a chain of five numbers:
#12496  14288  15472  14536  14264 ( 12496  ...)
#Since this chain returns to its starting point, it is called an amicable chain.
#Find the smallest member of the longest amicable chain with no element exceeding one million.

require "prime"

class Integer
	def next_amicable
		1.upto(self/2).select{|n| self % n == 0}.reduce(:+)
	end
end

#myfile = File.new("divisor_sum.txt", "w+")
#lookup = []
#(1..1E6).each do |i|
#	i.prime? ? myfile.puts(1) : myfile.puts(i.next_amicable)
#end

amicables = [0]
myfile = File.new("divisor_sum.txt", "r")
myfile.each_line do |num|
	amicables << num.strip!.to_i
end

for i in 1..1E6
	chain = [i]
	loop do
		chain << amicables[i]
		break if chain.last == 1
		if chain.include?(amicables[chain.first])
			chain << amicables[chain.last]
			puts chain.inspect
			break
		end
	end
end