#The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#(Please note that the palindromic number, in either base, may not include leading zeros.)

class String
	def palindromic?
		self.to_s == self.to_s.reverse
	end
end
puts (1..1E6).select{ |num| num.to_s.palindromic? && num.to_s(2).palindromic? }.reduce(:+)
