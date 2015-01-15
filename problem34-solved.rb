#145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#Note: as 1! = 1 and 2! = 2 are not sums they are not included.

class Integer
	def fact() self.zero? ? 1 : (1..self).reduce(:*) end
end

solution = []
arr = (0..9).to_a.map{|n| n.fact}
for num in 3..7*9.fact
	sum = num.to_s.split(//).map{|n| arr[n.to_i]}.reduce(:+)
	if num == sum
		solution << num
		p "FSUM: #{num.to_s.split(//).map{|n| n.to_i.fact}.reduce(:+) } NUM: #{num}"
	end
end
puts solution.uniq.reduce(:+)