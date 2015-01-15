#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
#Find the largest palindrome made from the product of two 3-digit numbers.

list = []
for x in 100..999
	for y in 100..999
		list << (x * y) if (x * y).to_s == (x * y).to_s.reverse
	end
end
puts "Largest: #{list.sort!.last}"