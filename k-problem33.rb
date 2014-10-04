#The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

nominator = 1
denominator = 1

for x in 10..99
	for y in 10..99
		subx = x.to_s[0].to_i
		suby = y.to_s[1].to_i
		cancelx = x.to_s[1].to_i
		cancely = y.to_s[0].to_i
		if x < y && cancelx == cancely && suby.nonzero? && x.to_f/y.to_f == subx.to_f/suby.to_f
			puts "#{x} / #{y} == #{subx} / #{suby}"
			nominator *= subx
			denominator *= suby
		end
	end
end

puts "#{nominator} / #{denominator}"