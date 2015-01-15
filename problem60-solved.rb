#The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
#Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

require "prime"
class Integer
	def concat_prime?(*args)
		temp = []
		temp << args << self
		temp.flatten!
		catch :nope do
			temp.combination(temp.size).to_a.each do |comb|
				comb.permutation.to_a.each do |pair|
					throw :nope if !((pair.first.to_s + pair.last.to_s).to_i.prime? && (pair.last.to_s + pair.first.to_s).to_i.prime?)
				end
			end
			return true
		end
		return false
	end
end

start = Time.new
solution = []
catch :done do
	Prime.each do |prime|
		solution.clear << prime
		catch :break do
			Prime.each do |n|
				solution << n if n.concat_prime?(solution)
				throw :done if solution.size >= 5
				puts solution.inspect if solution.size >= 4
				throw :break if n > 10000
			end
		end
	end
end
puts solution.inspect
puts solution.reduce(:+)
puts "time: #{Time.now.to_f - start.to_f}"