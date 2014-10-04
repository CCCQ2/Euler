#An irrational decimal fraction is created by concatenating the positive integers:
#0.123456789101112131415161718192021...
#It can be seen that the 12th digit of the fractional part is 1.
#If dn represents the nth digit of the fractional part, find the value of the following expression.
#d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

fract = ""
inc = 1
while fract.size <= 1E6
	fract << inc.to_s
	inc += 1
end
product = 1
(0..6).each{ |x| product *= fract[1*10**x -1].to_i }
puts product