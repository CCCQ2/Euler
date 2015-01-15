#It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
#Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

(1..1E6).each do |num|
	(2..6).each do |mul|
		break if num.to_s.split(//).sort != (num*mul).to_s.split(//).sort
		puts num if mul == 6
	end
end