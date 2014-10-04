#A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
#Considering natural numbers of the form, ab, where a, b  100, what is the maximum digital sum?

max = 0
100.downto(1) do |a|
	100.downto(1) do |b|
		sum = (a**b).to_s.split('').map{|n| n.to_i}.reduce(:+)
		max = sum if sum > max
	end
end
puts max
