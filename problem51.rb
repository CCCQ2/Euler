#By replacing the 1st digit of *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
#Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

require "prime"
class Array
	def dup_hash
		inject(Hash.new(0)) { |h,e| h[e] += 1; h }.select { |k,v| v > 1 }.inject({}) { |r, e| r[e.first] = e.last; r }.sort_by{|n| n[1]}
	end
end
class String
	def apply_mask(mask)
		result = ""
		self.split(//).each_with_index do |d, i|
			mask[i].to_i.zero? ? result << "*" : result << d
		end
		return result
	end
end

primes = Prime.each(1E6).to_a.map{|n| n.to_s}
for i in 2..3
	masks = [0, 1].repeated_permutation(i).to_a.select{|n| n.reduce(:+).between?(1, i-2)}.map{|n| n.join}
	nums = primes.select{|n| n.size == i}
	
	temp = []
	nums.product(masks).each do |combs|
		temp << combs[0].apply_mask(combs[1])
	end
	puts temp.dup_hash.inspect
end