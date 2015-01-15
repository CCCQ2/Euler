#The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#What 12-digit number do you form by concatenating the three terms in this sequence?

require "prime"
solution = []
(1000..9999).each do |num|
	temp = num.to_s.split(//).permutation.to_a.map{|n| n.join.to_i}.uniq.sort
	temp.each do |t|
		solution << "#{t}#{t+3330}#{t+6660}" if t > 1000 && temp.include?(t) && temp.include?(t+3330) && temp.include?(t+6660) && (t.prime? && (t+3330).prime? && (t+6660).prime?)
	end
end
puts solution.uniq