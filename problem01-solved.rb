# PROBLEM
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# START TIMER
start = Time.new

# CODE
puts (0..999).select{|n| n%3 == 0 || n%5 == 0}.reduce(:+)

# STOP TIMER
puts "time: #{Time.now.to_f - start.to_f}"