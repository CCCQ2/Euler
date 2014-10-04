#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

require "mathn"
total = 0
Prime.each(2E6) do |prime|
	total += prime
end
puts total