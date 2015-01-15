# PROBLEM
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

# START TIMER
start = Time.new

# CODE
require "mathn"
total = 0
Prime.each(2E6) do |prime|
	total += prime
end
puts total

# STOP TIMER
puts "time: #{Time.now.to_f - start.to_f}"