#The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

require "prime"
class Integer
	def trunc_prime?
		bool = true
		ltemp = self
		rtemp = self
		for i in 1..self.to_s.size
			if ltemp.prime? && rtemp.prime?
				bool = true
				ltemp = ltemp.to_s.chop.to_i
				rtemp = self.to_s[i..(self.to_s.size - 1)].to_i
			else
				bool = false
				break
			end
		end
		return bool
	end
end

solution = []
Prime.each do |prime|
	if prime > 7 && prime.trunc_prime?
		puts "#{prime} is a trunc prime."
		solution << prime
		solution.count == 11 ? break : nil
	end
end
p solution.inject(:+)
