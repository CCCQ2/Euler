#The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube. Find the smallest cube for which exactly five permutations of its digits are cube.

solution = []
lookup = (1..1E4).to_a.map{|n| n**3}
cube = lookup.sort_by{|c| c.to_s.size}.map{|n| n.to_s.split(//).sort!.join.to_s}
digits = cube.inject(Hash.new(0)){|sums,x| sums[x] += 1; sums}.sort_by{|n| n[1]}.select{|n| n[1] == 5}.map{|digits| digits.first}
puts "Selected: #{digits.inspect}"
digits.each do |x|
	lookup.each do |y|
		solution << y if x.split(//).sort == y.to_s.split(//).sort
	end
end
puts solution.sort

#Solution propre
puts "-" * 50
M = 5
N = 10000
hash = Hash.new {|hash, key| hash[key] = []}
(1..N).each do |n| i = n**3
	arr = i.to_s.split(//).sort
	hash[arr] << i
	puts hash[arr] or break if hash[arr].size >= M
end