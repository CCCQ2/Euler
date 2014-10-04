#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

puts (0..999).select{|n| n%3 == 0 || n%5 == 0}.reduce(:+)

# Pseudo-code solving steps
#--------------------------
# All NUMBERS < 1000
# FILTER NUMBERS OF A INTEGER RANGE THAT ARE MULTIPLES OF 3 OR 5
# SUM THE FILTERED NUMBERS

# Possible viz
#---------------
# Gravity fed numbers with a size filter
# Using the analogy of gravity with a filter in WebGL
# Find a way to graphically filter 3 and 5 multiples with shapes
# Use research on number viz to show a multiple check
# Transform / melt to liquid to illustrate summing process
# Use a vertical stack to show filtered numbers summing
