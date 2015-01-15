# PROBLEM
#The following iterative sequence is defined for the set of positive integers:
#n  n/2 (n is even)
#n  3n + 1 (n is odd)
#Using the rule above and starting with 13, we generate the following sequence:
#13  40  20  10  5  16  8  4  2  1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#Which starting number, under one million, produces the longest chain?
#NOTE: Once the chain starts the terms are allowed to go above one million.

# START TIMER
start = Time.new

# FUNCTIONS
def reduction(n)
    list = []
    until n == 1 do
        list << n
        n = (n.even? ? (n / 2) : (3 * n + 1))
    end
    list << 1
    return list
end

# CODE
max = []
for x in 1..1E6
    sequence = reduction(x)
    max = sequence if sequence.size > max.size
end
puts "Max number #{max.first} size: #{max.count} - #{max}"

# STOP TIMER
puts "time: #{Time.now.to_f - start.to_f}"