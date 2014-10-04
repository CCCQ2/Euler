#It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#9 = 7 + 2x1^2
#15 = 7 + 2x2^2
#21 = 3 + 2x3^2
#25 = 7 + 2x3^2
#27 = 19 + 2x2^2
#33 = 31 + 2x1^2
#It turns out that the conjecture was false.
#What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

require "mathn"
primes = Prime.each(10000).to_a
squares = (0..100).map{|n| 2*n**2 }

(5..10000).step(2).each do |num|
	subprimes = primes.select{|n| n < num}
	subsquares = squares.select{|n| n < num}
	combs = subprimes.product(subsquares).map{|n| n.reduce(:+)}
	if !(combs.include?(num) || num.to_i.prime?)
		puts "#{num} not found"
		break
	end
end
