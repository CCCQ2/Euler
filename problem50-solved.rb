#The prime 41, can be written as the sum of six consecutive primes:
#41 = 2 + 3 + 5 + 7 + 11 + 13
#This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#Which prime, below one-million, can be written as the sum of the most consecutive primes?

require 'mathn'

solution = []
primes = Prime.each(1E5).to_a
for off in 0..primes.size - 1
	for len in 0..primes.size - 1
		sum = primes[off..off+len].reduce(:+)
		if sum.prime? && primes[off..off+len].size > solution.size && sum < 1000000
			solution = primes[off..off+len]
			puts "#{solution.reduce(:+)} #{solution}"
		end
	end
end