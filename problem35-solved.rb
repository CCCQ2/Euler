#The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#How many circular primes are there below one million?

require "mathn"
start = Time.new
circular = 0

Prime.each(1E6) do |prime|
	counter = 0
	rotations = []
	for x in 1..prime.to_s.length - 1
		rotations << prime.to_s.split('').rotate(x).join('')
	end
	rotations.map {|number| counter += 1 if number.to_i.prime? }
	if rotations.size == counter
		circular += 1
		puts "Circular #{circular}: #{prime} - #{rotations.join(',')}"
	end
end

print "CPU: ", Time.now.to_f - start.to_f
